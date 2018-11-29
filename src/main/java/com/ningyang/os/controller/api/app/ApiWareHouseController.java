package com.ningyang.os.controller.api.app;

import com.ningyang.os.action.input.command.api.ApiWarehousePutInCommand;
import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.action.input.condition.serve.QueryOrderCondition;
import com.ningyang.os.action.output.vo.web.serve.SaleOrderVo;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.pojo.SysUserInfo;
import com.ningyang.os.service.ILSerWarehouseGoodsInfoService;
import com.ningyang.os.service.ILSerWarehouseGoodsOutInfoService;
import com.ningyang.os.service.ISerOrderInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import static com.ningyang.os.action.enums.SystemErrorEnum.*;

/**
 * @Author： kaider
 * @Date：2018/11/27 10:21
 * @描述：
 */
@Api(tags = {"仓管操作模块"})
@RestController
@RequestMapping("api/app/warehouse")
public class ApiWareHouseController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ApiWareHouseController.class);

    @Autowired
    private ILSerWarehouseGoodsInfoService putInService;
    @Autowired
    private ILSerWarehouseGoodsOutInfoService putOutService;
    @Autowired
    private ISerOrderInfoService orderInfoService;




    @ApiOperation(value = "入库")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "sourceType", value = "入库来源（0：生产入库，1：换货入库，2：退货入库，3：换仓入库）", paramType = "query"),
            @ApiImplicitParam(name = "warehouse", value = "仓库", required = true, paramType = "query"),
            @ApiImplicitParam(name = "boxCode", value = "箱码", required = true, paramType = "query", allowMultiple = true),
            @ApiImplicitParam(name = "remark", value = "入库备注", paramType = "query")

    })
    @PostMapping("putIn")
    public Map<String, Object> putIn(
            @RequestHeader("Authorization") String userToken,
            ApiWarehousePutInCommand command
    ) {
        try {
            SysUserInfo loginUser = getBaseUserInfo(userToken);
            if (loginUser != null) {
                command.setUserId(loginUser.getId());
                boolean flag = putInService.add(command);
                if (flag) {
                    return WebResult.success().toMap();
                }
                return WebResult.failure(PUTIN_WAREHOUSE_ERROR.getInfo()).toMap();
            }
            return WebResult.failure(PERMISSION_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(API_REQUEST_ERROR.getInfo()).toMap();
        }
    }


    @ApiOperation(value = "销售订单列表")
    @GetMapping("getOrderSaleList")
    public Map<String, Object> getOrderSaleList(
            @RequestHeader("Authorization") String userToken
    ) {
        try {
            SysUserInfo loginUser = getBaseUserInfo(userToken);
            if (loginUser != null) {
                QueryOrderCondition condition = new QueryOrderCondition();
                condition.setOrderState(2);
                List<SaleOrderVo> listVo = orderInfoService.findSaleOrderVoListByCondition(condition);
                return WebResult.success().put("listVo", listVo).toMap();
            }
            return WebResult.failure(PERMISSION_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(API_REQUEST_ERROR.getInfo()).toMap();
        }
    }


    @ApiOperation(value = "出库")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "orderId", value = "订单号Id", required = true, paramType = "query"),
            @ApiImplicitParam(name = "boxCode", value = "箱码", required = true, paramType = "query", allowMultiple = true),
            @ApiImplicitParam(name = "warehouse", value = "仓库", paramType = "query")
    })
    @PostMapping("putOut")
    public Map<String, Object> putOut(
            @RequestHeader("Authorization") String userToken,
            ApiWarehousePutOutCommand command
    ) {
        try {
            SysUserInfo loginUser = getBaseUserInfo(userToken);
            if (loginUser != null) {
                command.setUserId(loginUser.getId());
                boolean flag = putOutService.add(command);
                if (flag) {
                    return WebResult.success().toMap();
                }
                return WebResult.failure(PUTOUT_WAREHOUSE_ERROR.getInfo()).toMap();
            }
            return WebResult.failure(PERMISSION_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(API_REQUEST_ERROR.getInfo()).toMap();
        }
    }

}
