package com.ningyang.os.controller.serve;

import com.ningyang.os.action.input.command.web.serve.PrizeSetLogCommand;
import com.ningyang.os.action.input.condition.serve.QueryPrizeCondition;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.service.ISerPrizeRecodeInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static com.ningyang.os.action.enums.SystemErrorEnum.DATA_ERROR;
import static com.ningyang.os.action.enums.SystemErrorEnum.OPERATING_ERROR;

/**
 * @Author： kaider
 * @Date：2018/12/03 11:51
 * @描述：商品布奖设置记录
 */
@RestController
@RequestMapping("serve/prize/set/log")
public class PrizeSetLogController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(PrizeSetLogController.class);

    @Autowired
    private ISerPrizeRecodeInfoService infoService;

    @GetMapping("getPageList")
    public Map<String,Object> getPageList(
            QueryPrizeCondition condition
    ){
        try {
//            Page<WarehouseVo> pageVo = infoService.findWarehouseVoPageByCondition(condition);
            return WebResult.success().put("pageVo", null).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }

    @PostMapping("addOrUpdate")
    public Map<String,Object> addOrUpdate(
            @RequestHeader("Authorization") String userToken,
            @RequestBody PrizeSetLogCommand command
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
