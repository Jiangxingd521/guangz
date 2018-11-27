package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutInCommand;
import com.ningyang.os.dao.SerWarehouseGoodsInfoMapper;
import com.ningyang.os.pojo.LSerWarehouseGoodsInfo;
import com.ningyang.os.pojo.SerGoodsInfo;
import com.ningyang.os.pojo.SerWarehouseGoodsInfo;
import com.ningyang.os.service.ILSerWarehouseGoodsInfoService;
import com.ningyang.os.service.ISerWarehouseGoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private ILSerWarehouseGoodsInfoService logPutInService;

    @Override
    public boolean add(List<ApiWarehousePutInCommand> goodsPutInList) {
        //商品入库
        List<SerWarehouseGoodsInfo> infoList = new ArrayList<>();
        for(ApiWarehousePutInCommand command : goodsPutInList){
            for(SerGoodsInfo goodsInfo : command.getGoodsInfoList()){
                SerWarehouseGoodsInfo info = new SerWarehouseGoodsInfo();
                info.setSourceType(command.getSourceType());
                info.setWarehouseId(command.getWarehouseId());
                info.setGoodsId(goodsInfo.getId());
                info.setBoxNo(goodsInfo.getM5());
                info.setWarehouseInNo(getOrderNum());
                info.setGoodsState(1);
                info.setRemark(command.getRemark());
                info.setUserId(command.getUserId());
                info.setCreateTime(new Date());
                info.setUpdateTime(new Date());
                infoList.add(info);
            }
        }
        boolean putInFlag = saveBatch(infoList);
        //插入日志
        List<LSerWarehouseGoodsInfo> lInfoList = new ArrayList<>();
        for(SerWarehouseGoodsInfo goodsInfo : infoList){
            LSerWarehouseGoodsInfo info = new LSerWarehouseGoodsInfo();
            info.setSourceType(goodsInfo.getSourceType());
            info.setWarehouseId(goodsInfo.getWarehouseId());
            info.setGoodsId(goodsInfo.getGoodsId());
            info.setBoxNo(goodsInfo.getBoxNo());
            info.setWarehouseInNo(goodsInfo.getWarehouseInNo());
            info.setUserId(goodsInfo.getUserId());
            info.setWarehouseInTime(goodsInfo.getCreateTime());
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            lInfoList.add(info);
        }
        boolean putInLogFlag = logPutInService.saveBatch(lInfoList);

        return putInFlag && putInLogFlag;
    }
}
