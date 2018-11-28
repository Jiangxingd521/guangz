package com.ningyang.os.controller.serve;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ningyang.os.action.input.command.web.serve.OrderDetailsCommand;
import com.ningyang.os.action.input.command.web.serve.OrderDetailsDelCommand;
import com.ningyang.os.action.input.command.web.serve.OrderSaleCommand;
import com.ningyang.os.action.input.condition.serve.QueryOrderCondition;
import com.ningyang.os.action.output.vo.web.serve.OrderDetailVo;
import com.ningyang.os.action.output.vo.web.serve.SaleOrderVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.service.ISerOrderInfoDetailsService;
import com.ningyang.os.service.ISerOrderInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import static com.ningyang.os.action.enums.SystemErrorEnum.*;

/**
 * @Author： kaider
 * @Date：2018/11/27 14:48
 * @描述：订单
 */
@RestController
@RequestMapping("serve/order")
public class OrderController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private ISerOrderInfoService infoService;
    @Autowired
    private ISerOrderInfoDetailsService detailsService;


    /**
     * 销售订单
     *
     * @param condition
     * @return
     */
    @GetMapping("getSalePage")
    public Map<String, Object> getSalePage(
            QueryOrderCondition condition
    ) {
        try {
            Page<SaleOrderVo> pageVo = infoService.findSaleOrderVoPageByCondition(condition);
            return WebResult.success().put("pageVo", pageVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }

    @PostMapping("addSale")
    public Map<String, Object> addOrUpdateSale(
            @RequestHeader("Authorization") String userToken,
            @RequestBody OrderSaleCommand command
    ) {
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

    @DeleteMapping("deleteSale/{orderId}")
    public Map<String, Object> deleteSale(
            @PathVariable("orderId") Long orderId
    ) {
        try {
            boolean flag = infoService.removeById(orderId);
            if (flag) {
                return WebResult.success().toMap();
            }
            return WebResult.failure(DELETE_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DELETE_ERROR.getInfo()).toMap();
        }
    }


    @GetMapping("getOrderDetailList")
    public Map<String,Object> getOrderDetailList(
            QueryOrderCondition condition
    ){
        try {
            List<OrderDetailVo> listVo = detailsService.findOrderDetailVoList(condition);
            return WebResult.success().put("listVo",listVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DELETE_ERROR.getInfo()).toMap();
        }
    }


    @PostMapping("addDetails")
    public Map<String,Object> addDetails(
            @RequestHeader("Authorization") String userToken,
            @RequestBody OrderDetailsCommand command
    ){
        try {
            Long operateUserId = getBaseUserInfo(userToken).getId();
            boolean flag = detailsService.add(command, operateUserId);
            if (flag) {
                return WebResult.success().toMap();
            }
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        }
    }

    @DeleteMapping("deleteDetails")
    public Map<String,Object> deleteDetails(
           @RequestBody OrderDetailsDelCommand command
    ){
        try {
            boolean flag = detailsService.removeById(command.getDetailId());
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
