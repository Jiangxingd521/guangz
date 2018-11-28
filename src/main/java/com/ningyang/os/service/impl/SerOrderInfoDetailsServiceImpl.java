package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.dao.SerOrderInfoDetailsMapper;
import com.ningyang.os.pojo.SerGoodsInfo;
import com.ningyang.os.pojo.SerOrderInfoDetails;
import com.ningyang.os.service.ISerOrderInfoDetailsService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 销售订单详情 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@Service
public class SerOrderInfoDetailsServiceImpl extends ServiceImpl<SerOrderInfoDetailsMapper, SerOrderInfoDetails> implements ISerOrderInfoDetailsService {

    @Override
    public boolean add(Long orderId, List<ApiWarehousePutOutCommand> goodsPutOutList) {
        //已扫描到的相关商品明细
        List<SerOrderInfoDetails> detailsList = new ArrayList<>();
        for (ApiWarehousePutOutCommand command : goodsPutOutList) {
            //获取出库的所有商品
            for (SerGoodsInfo info : command.getGoodsInfoList()) {
                //商品放到出货明细里面
                SerOrderInfoDetails details = new SerOrderInfoDetails();
                details.setOrderId(orderId);
                details.setProductId(info.getBrandSeriesProductId());
                details.setGoodsId(info.getId());
                details.setCreateTime(new Date());
                details.setUpdateTime(new Date());
                detailsList.add(details);
            }
        }

        return saveBatch(detailsList);
    }

}
