package com.ningyang.os.controller.center;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ningyang.os.action.config.SystemConfig;
import com.ningyang.os.action.input.command.web.serve.ApplyCodeCommand;
import com.ningyang.os.action.input.command.web.serve.CenterCodeCommand;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.serve.ApplyCodeVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.pojo.SysUserInfo;
import com.ningyang.os.service.ISerApplyCodeInfoService;
import com.ningyang.os.service.ISerApplyCodeTemplateService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static cn.hutool.http.HttpUtil.post;
import static com.ningyang.os.action.enums.SystemErrorEnum.*;
import static com.ningyang.suyuan.node.action.utils.DateUtil.getOrderNum;

/**
 * @Author： kaider
 * @Date：2018/11/15 16:15
 * @描述：溯源码申请
 */
@RestController
@RequestMapping("center/qrcode/apply")
public class ApplyCodeController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ApplyCodeController.class);

    @Autowired
    private ISerApplyCodeInfoService infoService;
    @Autowired
    private ISerApplyCodeTemplateService templateService;
    @Autowired
    private SystemConfig config;

    @GetMapping("getApplyCodePage")
    public Map<String, Object> getApplyCodePage(
            QueryCodeCondition condition
    ) {
        try {
            Page<ApplyCodeVo> pageVo = infoService.findApplyCodeVoPageByCondition(condition);
            return WebResult.success().put("pageVo", pageVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }

    /**
     * 向中心请求二维码
     *
     * @param userToken
     * @param command
     * @return
     */
    @PostMapping("add")
    public Map<String, Object> add(
            @RequestHeader("Authorization") String userToken,
            @RequestBody ApplyCodeCommand command
    ) {
        try {
            SysUserInfo userInfo = getBaseUserInfo(userToken);
            if (userInfo != null) {
                command.setApplyUserId(userInfo.getId());

                String userCode = getAuthorizationCode(0);
                if (StringUtils.isNotBlank(userCode)) {
                    command.setUserCode(userCode);
                    if (command.getCodeType() == 9) {
                        command.setCodePosition(2L);
                    }
                    command.setCodeOrder(getOrderNum());
                    String result = post(config.getDefaultCenterUrl() + "company/web/api/makeCodeOrder", JSONObject.toJSONString(command));
                    JSONObject object = JSONObject.parseObject(result);
                    boolean flag = (boolean) object.get("result");
                    if (flag) {
                        //插入申请记录
                        boolean flag1 = infoService.add(command);
                        if (flag1) {
                            return WebResult.success().toMap();
                        } else {
                            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
                        }
                    }
                } else {
                    return WebResult.failure(PERMISSION_ERROR.getInfo()).toMap();
                }
            }
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        }
    }

    /**
     * 中心通信存储溯源码
     *
     * @param command
     * @return
     */
    @PostMapping("getApplyCodeData")
    public Map<String, Object> getApplyCodeData(
            @RequestBody CenterCodeCommand command
    ) {
        String centerCode = command.getApiCode();
        String nodeCode = getAuthorizationCode(1);

        if (centerCode.equals(nodeCode)) {
            boolean codeFlag = templateService.addBatch(command);
            if (codeFlag) {
                boolean applyFlag = infoService.updateApplyState(command);
                if (applyFlag) {
                    return WebResult.success().toMap();
                }
                return WebResult.failure(EDIT_ERROR.getInfo()).toMap();
            }
            return WebResult.failure(IMPORT_DATA_ERROR.getInfo()).toMap();
        } else {
            return WebResult.failure(SEND_ERROR.getInfo()).toMap();
        }
    }


}
