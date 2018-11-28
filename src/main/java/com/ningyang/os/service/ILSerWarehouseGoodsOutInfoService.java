package com.ningyang.os.service;

import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.pojo.LSerWarehouseGoodsOutInfo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 商品出库记录日志 服务类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
public interface ILSerWarehouseGoodsOutInfoService extends IService<LSerWarehouseGoodsOutInfo> {

    boolean add(ApiWarehousePutOutCommand command);

}
