package com.ningyang.os.service;

import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.pojo.SerOrderInfoDetails;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 销售订单详情 服务类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
public interface ISerOrderInfoDetailsService extends IService<SerOrderInfoDetails> {

    boolean add(Long orderId, List<ApiWarehousePutOutCommand> goodsPutOutList);

}
