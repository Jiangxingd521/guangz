package com.ningyang.os.controller.serve;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ningyang.os.action.input.condition.serve.QueryPrizeCondition;
import com.ningyang.os.action.output.vo.web.serve.DealerVo;
import com.ningyang.os.action.output.vo.web.serve.PrizeTypeVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.service.ISerPrizeTypeInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

import static com.ningyang.os.action.enums.SystemErrorEnum.DATA_ERROR;

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





}
