package com.ningyang.os.controller.api.app;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ningyang.os.action.input.command.api.ApiWarehousePutInCommand;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.pojo.SerGoodsInfo;
import com.ningyang.os.pojo.SysUserInfo;
import com.ningyang.os.service.ISerGoodsInfoService;
import com.ningyang.os.service.ISerWarehouseGoodsInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
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
    private ISerGoodsInfoService goodsInfoService;
    @Autowired
    private ISerWarehouseGoodsInfoService putInService;


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
            Long warehouse,
            String[] boxCode,
            int sourceType,
            String remark
    ) {
        try {
            SysUserInfo loginUser = getBaseUserInfo(userToken);
            if (loginUser != null) {
                List<ApiWarehousePutInCommand> goodsPutInList = new ArrayList<>();
                for (String boxCodeStr : boxCode) {
                    ApiWarehousePutInCommand command = new ApiWarehousePutInCommand();
                    command.setSourceType(sourceType);
                    command.setWarehouseId(warehouse);
                    command.setUserId(loginUser.getId());
                    command.setRemark(remark);
                    List<SerGoodsInfo> goodsInfoList = goodsInfoService.list(new QueryWrapper<SerGoodsInfo>().eq("M5", boxCodeStr));
                    command.setGoodsInfoList(goodsInfoList);
                    goodsPutInList.add(command);
                }
                boolean flag = putInService.add(goodsPutInList);
                if(flag){
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


}
