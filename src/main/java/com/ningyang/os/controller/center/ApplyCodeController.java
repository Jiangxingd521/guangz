package com.ningyang.os.controller.center;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ningyang.os.action.input.command.web.serve.ApplyCodeCommand;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.serve.ApplyCodeVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.pojo.SysUserInfo;
import com.ningyang.os.service.ISerApplyCodeInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static com.ningyang.os.action.enums.SystemErrorEnum.DATA_ERROR;
import static com.ningyang.os.action.enums.SystemErrorEnum.OPERATING_ERROR;

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

    // FIXME: 2018/11/15 向中心请求二维码
    @PostMapping("add")
    public Map<String, Object> add(
            @RequestHeader("Authorization") String userToken,
            @RequestBody ApplyCodeCommand command
    ) {
        try {
            SysUserInfo userInfo = getBaseUserInfo(userToken);
            if (userInfo != null) {
                command.setApplyUserId(userInfo.getId());
                boolean flag = infoService.add(command);
                if (flag) {
                    return WebResult.success().toMap();
                }
            }
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        }
    }


}
