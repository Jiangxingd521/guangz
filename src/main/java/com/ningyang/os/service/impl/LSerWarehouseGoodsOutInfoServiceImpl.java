package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.action.input.condition.serve.QueryGoodsPutCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsPutOutVo;
import com.ningyang.os.dao.LSerWarehouseGoodsOutInfoMapper;
import com.ningyang.os.pojo.LSerWarehouseGoodsOutInfo;
import com.ningyang.os.pojo.SerOrderInfo;
import com.ningyang.os.service.ILSerWarehouseGoodsOutInfoService;
import com.ningyang.os.service.ISerOrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TreeSet;

import static com.ningyang.os.action.utils.DateUtil.timeToStr;
import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.collectingAndThen;
import static java.util.stream.Collectors.toCollection;

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

    @Autowired
    private ISerOrderInfoService orderInfoService;


    @Override
    public boolean add(ApiWarehousePutOutCommand command) {
        List<LSerWarehouseGoodsOutInfo> infoList = new ArrayList<>();
        for (String boxNo : command.getBoxCode()) {
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
        //去除数组里面的重复对象
        List<LSerWarehouseGoodsOutInfo> listTemp = infoList.stream().collect(
                collectingAndThen(toCollection(() -> new TreeSet<>(comparing(LSerWarehouseGoodsOutInfo::getBoxNo))), ArrayList::new)
        );
        boolean flag;
        //订单箱数
        int orderBoxCount = orderInfoService.getOrderBoxCount(command.getOrderId());
        //已出箱数
        int outBoxCount = getOrderOutBoxCount(command.getOrderId());

        if(outBoxCount<orderBoxCount){//订单未完成
            flag = saveBatch(listTemp);
            if(flag){
                //更改订单状态
                SerOrderInfo orderInfo = orderInfoService.getById(command.getOrderId());
                orderInfo.setOrderState(3);
                orderInfo.setUpdateTime(new Date());
                orderInfoService.updateById(orderInfo);
            }
        }else if(outBoxCount == orderBoxCount){//订单已完成
            flag = saveBatch(listTemp);
            if(flag){
                //更改订单状态
                SerOrderInfo orderInfo = orderInfoService.getById(command.getOrderId());
                orderInfo.setOrderState(4);
                orderInfo.setUpdateTime(new Date());
                orderInfoService.updateById(orderInfo);
            }
        }else{//出货数据不对
            flag = false;
        }
        return flag;
    }

    @Override
    public Page<GoodsPutOutVo> findGoodsPutOutVoPageByCondition(QueryGoodsPutCondition condition) {
        Page<GoodsPutOutVo> pageVo = new Page<>();
        List<GoodsPutOutVo> listVoTemp = baseMapper.selectGoodsPutOutVoPageByCondition(condition);
        for (GoodsPutOutVo vo : listVoTemp) {
            vo.setGoodsOutTimeStr(timeToStr(vo.getGoodsOutTime()));
            int orderBoxCount = orderInfoService.getOrderBoxCount(vo.getOrderId());
            vo.setOrderBoxCount(orderBoxCount);
            int outBoxCount = getOrderOutBoxCount(vo.getOrderId());
            vo.setOutBoxCount(outBoxCount);
        }
        int total = baseMapper.selectGoodsPutOutVoPageCountByCondition(condition);
        pageVo.setRecords(listVoTemp);
        pageVo.setTotal(total);
        pageVo.setSize(condition.getPage());
        pageVo.setCurrent(condition.getLimit());
        return pageVo;
    }

    @Override
    public List<GoodsPutOutVo> findGoodsPutOutVoByCondition(QueryGoodsPutCondition condition) {
        return baseMapper.selectGoodsPutOutVoByCondition(condition);
    }

    @Override
    public int getWarehouseBoxCount(Long warehouseId) {
        return baseMapper.getWarehouseBoxCount(warehouseId);
    }

    @Override
    public int getOrderOutBoxCount(Long orderId) {
        return baseMapper.getOrderOutBoxCount(orderId);
    }
}
