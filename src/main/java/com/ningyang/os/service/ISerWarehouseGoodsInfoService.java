package com.ningyang.os.service;

import com.ningyang.os.action.input.command.api.ApiWarehousePutInCommand;
import com.ningyang.os.pojo.SerWarehouseGoodsInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 商品入库 服务类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
public interface ISerWarehouseGoodsInfoService extends IService<SerWarehouseGoodsInfo> {

    boolean add(ApiWarehousePutInCommand command);

}
