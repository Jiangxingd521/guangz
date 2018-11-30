package com.ningyang.os.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ningyang.os.action.input.command.api.ApiWarehousePutInCommand;
import com.ningyang.os.pojo.SerWarehouseGoodsInfo;

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
