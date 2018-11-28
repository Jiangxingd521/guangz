package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.pojo.LSerWarehouseGoodsOutInfo;
import com.ningyang.os.dao.LSerWarehouseGoodsOutInfoMapper;
import com.ningyang.os.service.ILSerWarehouseGoodsOutInfoService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 商品出库记录日志 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@Service
public class LSerWarehouseGoodsOutInfoServiceImpl extends ServiceImpl<LSerWarehouseGoodsOutInfoMapper, LSerWarehouseGoodsOutInfo> implements ILSerWarehouseGoodsOutInfoService {

    @Override
    public boolean add(ApiWarehousePutOutCommand command) {
        List<LSerWarehouseGoodsOutInfo> infoList = new ArrayList<>();
        for(String boxNo : command.getBoxCode()){
            LSerWarehouseGoodsOutInfo info = new LSerWarehouseGoodsOutInfo();
            info.setOrderId(command.getOrderId());
            info.setWarehouseId(command.getWarehouse());
            info.setBoxNo(boxNo);
            info.setUserId(command.getUserId());
            info.setGoodsOutTime(new Date());
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            infoList.add(info);
        }
        return saveBatch(infoList);
    }
}
