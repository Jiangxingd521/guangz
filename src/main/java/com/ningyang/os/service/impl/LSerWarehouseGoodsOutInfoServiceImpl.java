package com.ningyang.os.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.action.input.condition.serve.QueryGoodsPutCondition;
import com.ningyang.os.action.output.dto.serve.PutOutDto;
import com.ningyang.os.action.output.vo.web.serve.GoodsPutOutVo;
import com.ningyang.os.dao.LSerWarehouseGoodsOutInfoMapper;
import com.ningyang.os.pojo.*;
import com.ningyang.os.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

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
    @Autowired
    private ISerOrderInfoDetailsService detailsService;
    @Autowired
    private ISerGoodsInfoService goodsInfoService;
    @Autowired
    private ILSerWarehouseGoodsInfoService putInService;

    @Override
    public Map<String, Object> add(ApiWarehousePutOutCommand command) {
        Map<String, Object> map = new HashMap<>();
        //订单箱数
        int orderBoxCount = orderInfoService.getOrderBoxCount(command.getOrderId());
        //扫码箱数
        int scanBoxCount = command.getBoxCode().length;
        //已出箱数
        int outBoxCount = getOrderOutBoxCount(command.getOrderId());
        //实际需要出箱数
        int actualBoxCount = orderBoxCount - outBoxCount;
        System.out.println("orderBoxCount:" + orderBoxCount + " scanBoxCount:" + scanBoxCount + " outBoxCount:" + outBoxCount + " actualBoxCount:" + actualBoxCount);
        if (scanBoxCount > actualBoxCount) {
            PutOutDto dto = new PutOutDto();
            dto.setFlag(false);
            dto.setMessage("扫码箱数大于订单箱数");
            map.put("putOutFlag", dto);
            return map;
        } else {
            List<LSerWarehouseGoodsInfo> unSafeList = new ArrayList<>();
            //查询所有箱子对应的商品
            List<LSerWarehouseGoodsInfo> goodsInfoList = new ArrayList<>();
            for (String boxNo : command.getBoxCode()) {
                LSerWarehouseGoodsInfo goodsInfo = putInService.getOne(new QueryWrapper<LSerWarehouseGoodsInfo>().eq("box_no", boxNo));
                if (goodsInfo != null) {
                    goodsInfoList.add(goodsInfo);
                } else {
                    LSerWarehouseGoodsInfo infoTemp = new LSerWarehouseGoodsInfo();
                    infoTemp.setBoxNo(boxNo);
                    unSafeList.add(infoTemp);
                }
            }
            //扫描到未入库的商品
            if (unSafeList.size() > 0) {
                PutOutDto dto = new PutOutDto();
                dto.setFlag(false);
                dto.setMessage("存在未入库的商品");
                dto.setObj(unSafeList);
                map.put("putOutFlag", dto);
                return map;
            }
            //查看订单详情
            List<SerOrderInfoDetails> detailsList = detailsService.list(new QueryWrapper<SerOrderInfoDetails>()
                    .eq("order_id", command.getOrderId()));

            List<LSerWarehouseGoodsOutInfo> infoList = new ArrayList<>();

            //当前
            Map<Long, List<SerOrderInfoDetails>> groupByDetails = detailsList.stream().collect(Collectors
                    .groupingBy(SerOrderInfoDetails::getProductId));

            Map<Long, List<LSerWarehouseGoodsInfo>> groupByGoods = goodsInfoList.stream().collect(Collectors
                    .groupingBy(LSerWarehouseGoodsInfo::getProductId));

//            putInService

        }















        /*for(){

        }*/










        /*
        //查看明细里面的商品数据
        for(SerOrderInfoDetails details : detailsList){
            //产品系列
            Long productId = details.getProductId();
            //箱数
            int boxNumber = details.getBoxNumber();

            List<SerGoodsInfo> goodsInfoList = new ArrayList<>();
            for(String boxNo : command.getBoxCode()){
                SerGoodsInfo goodsInfo = goodsInfoService.getOne(new QueryWrapper<SerGoodsInfo>().eq("M5",boxNo));
                goodsInfoList.add(goodsInfo);
            }

            int


        }*/



        /*for (String boxNo : command.getBoxCode()) {
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
        }*/
        return map;
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
