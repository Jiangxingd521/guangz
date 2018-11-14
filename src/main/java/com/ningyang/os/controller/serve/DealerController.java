package com.ningyang.os.controller.serve;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ningyang.os.action.input.command.web.serve.DealerCommand;
import com.ningyang.os.action.input.condition.serve.QueryDealerCondition;
import com.ningyang.os.action.output.vo.web.serve.DealerVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.service.ISerDealerInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static com.ningyang.os.action.enums.SystemErrorEnum.DATA_ERROR;
import static com.ningyang.os.action.enums.SystemErrorEnum.OPERATING_ERROR;

/**
 * @Author： kaider
 * @Date：2018/11/14 16:50
 * @描述：经销商管理
 */
@RestController
@RequestMapping("serve/dealer")
public class DealerController {

    private static final Logger LOGGER = LoggerFactory.getLogger(DealerController.class);

    @Autowired
    private ISerDealerInfoService infoService;


    @GetMapping("getDealerPage")
    public Map<String,Object> getDealerPage(
            QueryDealerCondition condition
    ){
        try {
            Page<DealerVo> pageVo = infoService.findDealerVoPageByCondition(condition);
            return WebResult.success().put("pageVo", pageVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }

    @PostMapping("addOrUpdate")
    public Map<String,Object> addOrUpdate(
            @RequestBody DealerCommand command
    ){
        try {
            boolean flag = infoService.addOrUpdate(command);
            if(flag){
                return WebResult.success().toMap();
            }
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        }
    }

}
