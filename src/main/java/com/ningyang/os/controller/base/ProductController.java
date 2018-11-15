package com.ningyang.os.controller.base;

import com.ningyang.os.action.input.command.web.base.ProductCommand;
import com.ningyang.os.action.input.condition.base.QueryBrandSeriesProductCondition;
import com.ningyang.os.action.output.vo.web.base.ProductVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.service.ISerBrandSeriesProductInfoService;
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
 * @Date：2018/11/13 14:28
 * @描述：产品库
 */
@RestController
@RequestMapping("base/product")
public class ProductController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ISerBrandSeriesProductInfoService infoService;

    @GetMapping("getBrandSeriesProductList")
    public Map<String, Object> getBrandSeriesProductList(
            QueryBrandSeriesProductCondition condition
    ) {
        try {
            List<ProductVo> listVo = infoService.findProductVoByCondition(condition);
            return WebResult.success().put("listVo", listVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }


    @PostMapping("addOrUpdate")
    public Map<String, Object> addOrUpdate(
            @RequestBody ProductCommand command
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
