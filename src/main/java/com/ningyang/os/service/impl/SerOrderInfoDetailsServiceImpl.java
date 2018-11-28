package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.dao.SerOrderInfoDetailsMapper;
import com.ningyang.os.pojo.LSerWarehouseGoodsOutInfo;
import com.ningyang.os.pojo.SerGoodsInfo;
import com.ningyang.os.pojo.SerOrderInfoDetails;
import com.ningyang.os.pojo.SerWarehouseGoodsInfo;
import com.ningyang.os.service.ILSerWarehouseGoodsOutInfoService;
import com.ningyang.os.service.ISerOrderInfoDetailsService;
import com.ningyang.os.service.ISerWarehouseGoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private ILSerWarehouseGoodsOutInfoService logPutOutService;
    @Autowired
    private ISerWarehouseGoodsInfoService putInService;

    @Override
    public boolean add(Long userId, Long orderId, List<ApiWarehousePutOutCommand> goodsPutOutList, String[] boxCode) {
        //已扫描到的相关商品明细
        List<SerOrderInfoDetails> detailsList = new ArrayList<>();
        //扫描到的商品日志
        List<LSerWarehouseGoodsOutInfo> logDetailsList = new ArrayList<>();

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
                //商品出库日志
                SerWarehouseGoodsInfo goodsInfo = putInService.getOne(new QueryWrapper<SerWarehouseGoodsInfo>()
                        .eq("goods_id", info.getId()));
                LSerWarehouseGoodsOutInfo logPutOut = new LSerWarehouseGoodsOutInfo();
                logPutOut.setOrderId(orderId);
                logPutOut.setWarehouseId(goodsInfo.getWarehouseId());
                logPutOut.setBoxNo(info.getM5());
                logPutOut.setProductId(info.getBrandSeriesProductId());
                logPutOut.setGoodsId(info.getId());
                logPutOut.setUserId(userId);
                logPutOut.setGoodsOutTime(new Date());
                logPutOut.setCreateTime(new Date());
                logPutOut.setUpdateTime(new Date());
                logDetailsList.add(logPutOut);
            }
        }

        boolean detailsFlag = saveBatch(detailsList);
        boolean logDetailsFlag = logPutOutService.saveBatch(logDetailsList);
        //已扫描到的相关商品
        List<SerWarehouseGoodsInfo> infoList = new ArrayList<>();
        for (String boxCodeStr : boxCode) {
            List<SerWarehouseGoodsInfo> infoListTemp = putInService.list(new QueryWrapper<SerWarehouseGoodsInfo>()
                    .eq("box_no", boxCodeStr));
            for (SerWarehouseGoodsInfo goodsInfo : infoListTemp) {
                infoList.add(goodsInfo);
            }
        }

        for (SerWarehouseGoodsInfo info : infoList) {
            info.setUserId(userId);
            info.setGoodsState(2);
            info.setUpdateTime(new Date());
        }

        boolean goodsFlag = putInService.updateBatchById(infoList);

        return detailsFlag && logDetailsFlag && goodsFlag;
    }

}
