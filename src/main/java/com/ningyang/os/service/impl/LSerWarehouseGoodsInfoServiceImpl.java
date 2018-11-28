package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutInCommand;
import com.ningyang.os.dao.LSerWarehouseGoodsInfoMapper;
import com.ningyang.os.pojo.LSerWarehouseGoodsInfo;
import com.ningyang.os.service.ILSerWarehouseGoodsInfoService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.ningyang.os.action.utils.DateUtil.getOrderNum;

/**
 * <p>
 * 商品入库记录日志 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@Service
public class LSerWarehouseGoodsInfoServiceImpl extends ServiceImpl<LSerWarehouseGoodsInfoMapper, LSerWarehouseGoodsInfo> implements ILSerWarehouseGoodsInfoService {

    @Override
    public boolean add(ApiWarehousePutInCommand command) {
        List<LSerWarehouseGoodsInfo> infoList = new ArrayList<>();
        for(String boxNo : command.getBoxCode()){
            LSerWarehouseGoodsInfo info = new LSerWarehouseGoodsInfo();
            info.setSourceType(command.getSourceType());
            info.setWarehouseId(command.getWarehouse());
            info.setBoxNo(boxNo);
            info.setWarehouseInNo(getOrderNum());
            info.setUserId(command.getUserId());
            info.setWarehouseInTime(new Date());
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            infoList.add(info);
        }
        return saveBatch(infoList);
    }




}
