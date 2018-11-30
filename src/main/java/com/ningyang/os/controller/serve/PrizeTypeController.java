package com.ningyang.os.controller.serve;

import com.ningyang.os.action.input.command.web.serve.PrizeTypeCommand;
import com.ningyang.os.action.input.condition.serve.QueryPrizeCondition;
import com.ningyang.os.action.output.vo.web.serve.PrizeTypeVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.service.ISerPrizeTypeInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import static com.ningyang.os.action.enums.SystemErrorEnum.DATA_ERROR;
import static com.ningyang.os.action.enums.SystemErrorEnum.OPERATING_ERROR;

/**
 * @Author： kaider
 * @Date：2018/11/29 18:24
 * @描述：奖项类型
 */
@RestController
@RequestMapping("serve/prize")
public class PrizeTypeController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(PrizeTypeController.class);

    @Autowired
    private ISerPrizeTypeInfoService infoService;


    @GetMapping("getTypeList")
    public Map<String,Object> getTypeList(
            QueryPrizeCondition condition
    ){
        try {
            List<PrizeTypeVo> listVo = infoService.findPrizeTypeVoListByCondition(condition);
            return WebResult.success().put("listVo", listVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }

    @PostMapping("addOrUpdateType")
    public Map<String,Object> addOrUpdate(
            @RequestHeader("Authorization") String userToken,
            @RequestBody PrizeTypeCommand command
    ){
        try {
            Long operateUserId = getBaseUserInfo(userToken).getId();
            boolean flag = infoService.addOrUpdate(command, operateUserId);
            if (flag) {
                return WebResult.success().toMap();
            }
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        }
    }

}
