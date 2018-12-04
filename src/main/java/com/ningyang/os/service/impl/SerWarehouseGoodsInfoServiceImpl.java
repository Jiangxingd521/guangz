package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutInCommand;
import com.ningyang.os.dao.SerWarehouseGoodsInfoMapper;
import com.ningyang.os.pojo.SerWarehouseGoodsInfo;
import com.ningyang.os.service.ISerWarehouseGoodsInfoService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.ningyang.os.action.utils.DateUtil.getOrderNum;

/**
 * <p>
 * 商品入库 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@Service
public class SerWarehouseGoodsInfoServiceImpl extends ServiceImpl<SerWarehouseGoodsInfoMapper, SerWarehouseGoodsInfo> implements ISerWarehouseGoodsInfoService {

    @Override
    public boolean add(ApiWarehousePutInCommand command) {
        List<SerWarehouseGoodsInfo> infoList = new ArrayList<>();
        for (String boxNo : command.getBoxCode()) {
            SerWarehouseGoodsInfo info = new SerWarehouseGoodsInfo();
            info.setSourceType(command.getSourceType());
            info.setWarehouseId(command.getWarehouse());
            info.setBoxNo(boxNo);
            info.setWarehouseInNo(getOrderNum());
            info.setGoodsState(1);
            info.setRemark(command.getRemark());
            info.setUserId(command.getUserId());
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            infoList.add(info);
        }
        return saveBatch(infoList);
    }

}
