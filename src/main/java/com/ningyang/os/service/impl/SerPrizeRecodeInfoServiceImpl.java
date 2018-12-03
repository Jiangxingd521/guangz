package com.ningyang.os.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.serve.PrizeSetLogCommand;
import com.ningyang.os.action.input.condition.serve.QueryGoodsPutCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsPutOutVo;
import com.ningyang.os.dao.SerPrizeRecodeInfoMapper;
import com.ningyang.os.pojo.SerPrizeRecodeInfo;
import com.ningyang.os.pojo.SerPrizeSetInfo;
import com.ningyang.os.service.ILSerWarehouseGoodsOutInfoService;
import com.ningyang.os.service.ISerPrizeRecodeInfoService;
import com.ningyang.os.service.ISerPrizeSetInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static com.ningyang.os.action.utils.RandomUtil.randomArray;

/**
 * <p>
 * 布奖记录 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
@Service
public class SerPrizeRecodeInfoServiceImpl extends ServiceImpl<SerPrizeRecodeInfoMapper, SerPrizeRecodeInfo> implements ISerPrizeRecodeInfoService {

    @Autowired
    private ISerPrizeSetInfoService infoService;
    @Autowired
    private ILSerWarehouseGoodsOutInfoService outInfoService;

    @Override
    public boolean addOrUpdate(PrizeSetLogCommand command, Long userId) {
        List<SerPrizeRecodeInfo> listData;
        List<GoodsPutOutVo> goodsPutOutVoList;
        //奖项设定内容
        SerPrizeSetInfo info = infoService.getById(command.getPrizeSetId());

        //布奖数量
        int prizeSetNumber = info.getPrizeQuantity();
        //选中的商品
        List<GoodsPutOutVo> listData1 = new ArrayList<>();
        //未选中的商品
        List<GoodsPutOutVo> listData2 = new ArrayList<>();

        if(command.getPrizeSpecies()==1){
            //订单
            listData = list(new QueryWrapper<SerPrizeRecodeInfo>().eq("order_no",command.getOrderNo()));
            //获取订单商品
            goodsPutOutVoList = getGoodsList(1,command.getOrderNo());

            //限制数量
            if(info.getPrizeSetType()==1){
                //获取随机不重复数
                int[] count = randomArray(0,goodsPutOutVoList.size(),prizeSetNumber);
                //依据总数随机选出来的商品
                for(int i=0;i<count.length;i++){
                    int j = count[i];
                    listData1.add(goodsPutOutVoList.get(j));
                }
                //剩余的商品
                for (int i=0;i<goodsPutOutVoList.size();i++){
                    for(int j=0;j<listData1.size();j++){
                        GoodsPutOutVo vo1 = goodsPutOutVoList.get(i);
                        if(vo1.getGoodsId() == listData1.get(j).getGoodsId()){
                            goodsPutOutVoList.remove(vo1);
                        }
                    }
                }
                listData2 = goodsPutOutVoList;

            }else{
                //不限量
                listData2 = goodsPutOutVoList;
            }


            /*for(GoodsPutOutVo vo : goodsPutOutVoList){

                SerPrizeRecodeInfo recodeInfo = new SerPrizeRecodeInfo();
                recodeInfo.setOrderNo(vo.getOrderNo());
                recodeInfo.setPrCode(vo.getPrCode());
                recodeInfo.setPrizeSetId(command.getPrizeSetId());
                recodeInfo.setPrizeSetName(info.getPrizeSetName());
                recodeInfo.setProdId(vo.getProdId());
                recodeInfo.setMemberType(info.getMemberType());
                recodeInfo.setRegionId(info.getRegionId());
                //奖项类型
                String setTypeStr = info.getSdata1();
                if(setTypeStr.equalsIgnoreCase("HB")){
                    //红包
                    if(info.getPrizeSetType()==1){
                        //限制数量
                        if(info.getPrizeModeType()==1){
                            //随机布奖
                            *//*if(randomFlag<=prizeSetNumber){
                                BigDecimal randomMoney = getRandomMoney(info.getMoney(),info.getMoneyEnd());
                                recodeInfo.setMoney(randomMoney);
                            }*//*
                        }else{
                            //平均布奖

                        }
                    }else{
                        //不限制数量
                        if(info.getPrizeModeType()==1){
                            //随机布奖

                        }else{
                            //平均布奖

                        }
                    }
                    recodeInfo.setSdata1("HB");
                }else if(setTypeStr.equalsIgnoreCase("TP")){
                    //积分
                    recodeInfo.setPonit(21);
                    recodeInfo.setSdata1("TP");
                }
                recodeInfo.setPrizeSetType(info.getPrizeSetType());
                recodeInfo.setPrizeModeType(info.getPrizeModeType());
                recodeInfo.setPrizeState(1);
                recodeInfo.setPrizeStartDate(info.getPrizeStartDate());
                recodeInfo.setPrizeEndDate(info.getPrizeEndDate());
                recodeInfo.setUserId(userId);
                recodeInfo.setCreateTime(new Date());
                recodeInfo.setUpdateTime(new Date());
                listData.add(recodeInfo);
            }*/
        }else{
            //产品系列
            listData = list(new QueryWrapper<SerPrizeRecodeInfo>().eq("prod_id",command.getProdId()));
            goodsPutOutVoList = null;
        }









        System.out.println(JSONObject.toJSONString(goodsPutOutVoList));
//        return saveOrUpdateBatch(listData);
        return false;
    }


    /**
     * 获取订单商品
     * @param type 1: 通过订单查询,2:通过产品系列查询
     * @param typeValue
     * @return
     */
    private List<GoodsPutOutVo> getGoodsList(int type, String typeValue){
        QueryGoodsPutCondition condition = new QueryGoodsPutCondition();
        if(type==1){
            condition.setOrderNo(typeValue);
        }else{
            condition.setProdId(typeValue);
        }
        return outInfoService.findGoodsPutOutVoByCondition(condition);
    }

    /**
     * 获取某个范围内随机金额
     * @param minVal
     * @param maxVal
     * @return
     */
    private BigDecimal getRandomMoney(BigDecimal minVal, BigDecimal maxVal){
        BigDecimal maxValTemp = maxVal.multiply(new BigDecimal(100));
        BigDecimal minValTemp = minVal.multiply(new BigDecimal(100));
        int max = maxValTemp.intValue();
        int min = minValTemp.intValue();
        Random random = new Random();
        int randomMoneyValTemp = random.nextInt(max)%(max-min+1) + min;
        BigDecimal randomMoneyVal = new BigDecimal(randomMoneyValTemp).divide(new BigDecimal(100));
        return randomMoneyVal;
    }

    /**
     *
     * @param userId
     * @param info
     * @param type
     * @param type2
     * @param listData
     * @param listDataTemp
     * @return
     */
    private List<SerPrizeRecodeInfo> getSerPrizeRecodeInfoList(
            Long userId,
            SerPrizeSetInfo info,
            int type,
            int type2,
            List<GoodsPutOutVo> listData,
            List<SerPrizeRecodeInfo> listDataTemp) {
        for (GoodsPutOutVo vo : listData) {
            SerPrizeRecodeInfo recodeInfo = new SerPrizeRecodeInfo();
            recodeInfo.setOrderNo(vo.getOrderNo());
            recodeInfo.setPrCode(vo.getPrCode());
            recodeInfo.setPrizeSetId(info.getPrizeSetId());
            recodeInfo.setPrizeSetName(info.getPrizeSetName());
            recodeInfo.setProdId(vo.getProdId());
            recodeInfo.setMemberType(info.getMemberType());
            recodeInfo.setRegionId(info.getRegionId());
            //奖项类型
            String setTypeStr = info.getSdata1();
            recodeInfo.setSdata1(setTypeStr);
            recodeInfo.setPrizeSetType(info.getPrizeSetType());
            recodeInfo.setPrizeModeType(info.getPrizeModeType());
            recodeInfo.setPrizeState(1);
            recodeInfo.setPrizeStartDate(info.getPrizeStartDate());
            recodeInfo.setPrizeEndDate(info.getPrizeEndDate());
            recodeInfo.setUserId(userId);
            recodeInfo.setCreateTime(new Date());
            recodeInfo.setUpdateTime(new Date());
            listDataTemp.add(recodeInfo);
        }
        return listDataTemp;
    }

}
