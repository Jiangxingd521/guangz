package com.ningyang.os.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.serve.OrderSaleCommand;
import com.ningyang.os.action.input.condition.serve.QueryOrderCondition;
import com.ningyang.os.action.output.vo.web.serve.SaleOrderVo;
import com.ningyang.os.dao.SerOrderInfoMapper;
import com.ningyang.os.pojo.SerOrderInfo;
import com.ningyang.os.service.ISerOrderInfoService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

import static com.ningyang.os.action.utils.DateUtil.getOrderNum;

/**
 * <p>
 * 销售订单表 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@Service
public class SerOrderInfoServiceImpl extends ServiceImpl<SerOrderInfoMapper, SerOrderInfo> implements ISerOrderInfoService {


    @Override
    public Page<SaleOrderVo> findSaleOrderVoPageByCondition(QueryOrderCondition condition) {
        Page<SaleOrderVo> pageVo = new Page<>();
        List<SaleOrderVo> listVoTemp = baseMapper.selectSaleOrderVoPageByCondition(condition);
        int total = baseMapper.selectSaleOrderVoPageCountByCondition(condition);
        pageVo.setRecords(listVoTemp);
        pageVo.setTotal(total);
        pageVo.setSize(condition.getPage());
        pageVo.setCurrent(condition.getLimit());
        return pageVo;
    }

    @Override
    public boolean addOrUpdate(OrderSaleCommand command, Long operateUserId) {
        System.out.println(JSONObject.toJSON(command));
        SerOrderInfo info = getById(command.getOrderId());
        boolean flag;
        if (info != null) {
            info.setDealerId(command.getDealerId());
            info.setProductId(command.getProductId());
            info.setProductNumber(command.getProductNumber());
            info.setOrderState(command.getOrderState());
            info.setOrderRemark(command.getRemark());
            if(command.getOperateType()==1){
                info.setFinancialId(operateUserId);
            }
            info.setUpdateTime(new Date());
            flag = updateById(info);
        } else {
            info = new SerOrderInfo();
            info.setOrderNo(getOrderNum());
            info.setDealerId(command.getDealerId());
            info.setProductId(command.getProductId());
            info.setProductNumber(command.getProductNumber());
            info.setOrderState(0);
            info.setOrderRemark(command.getRemark());
            info.setUserId(operateUserId);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag = save(info);
        }
        return flag;
    }

    @Override
    public List<SaleOrderVo> findSaleOrderVoListByCondition(QueryOrderCondition condition) {
        return baseMapper.selectSaleOrderVoListByCondition(condition);
    }
}
