package com.ningyang.os.controller.base;

import com.ningyang.os.action.input.command.web.base.CodeTypeCommand;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.base.CodeTypeVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.service.ISerCodeTypeInfoService;
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
 * @Date：2018/11/14 09:51
 * @描述：码类型
 */
@RestController
@RequestMapping("base/codeType")
public class CodeTypeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CodeTypeController.class);

    @Autowired
    private ISerCodeTypeInfoService infoService;

    @GetMapping("getCodeTypeList")
    public Map<String, Object> getCodeTypeList(
            QueryCodeCondition condition
    ) {
        try {
            List<CodeTypeVo> listVo = infoService.findCodeTypeVoByCondition(condition);
            return WebResult.success().put("listVo", listVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }

    @PostMapping("addOrUpdate")
    public Map<String, Object> addOrUpdate(
            @RequestBody CodeTypeCommand command
    ) {
        try {
            boolean flag = infoService.addOrUpdate(command);
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
