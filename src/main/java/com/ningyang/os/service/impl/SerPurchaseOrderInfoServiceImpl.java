package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.serve.OrderPurchaseCommand;
import com.ningyang.os.action.input.condition.serve.QueryOrderCondition;
import com.ningyang.os.action.output.vo.web.serve.OrderDetailVo;
import com.ningyang.os.action.output.vo.web.serve.OrderPurchaseVo;
import com.ningyang.os.dao.SerPurchaseOrderInfoMapper;
import com.ningyang.os.pojo.SerPurchaseOrderInfo;
import com.ningyang.os.pojo.SerPurchaseOrderInfoDetails;
import com.ningyang.os.service.ISerPurchaseOrderInfoDetailsService;
import com.ningyang.os.service.ISerPurchaseOrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.ningyang.os.action.utils.DateUtil.getOrderNum;

/**
 * <p>
 * 商品退货订单 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
@Service
public class SerPurchaseOrderInfoServiceImpl extends ServiceImpl<SerPurchaseOrderInfoMapper, SerPurchaseOrderInfo> implements ISerPurchaseOrderInfoService {

    @Autowired
    private ISerPurchaseOrderInfoDetailsService detailsService;

    @Override
    public Page<OrderPurchaseVo> findOrderPurchaseVoPageByCondition(QueryOrderCondition condition) {
        Page<OrderPurchaseVo> pageVo = new Page<>();
        List<OrderPurchaseVo> listVoTemp = baseMapper.selectOrderPurchaseVoPageByCondition(condition);
        for (OrderPurchaseVo vo : listVoTemp) {
            //订单详情
            condition.setPurchaseId(vo.getPurchaseId());
            List<OrderDetailVo> detailList = detailsService.findOrderDetailVoList(condition);
            vo.setDetailList(detailList);
            //接收到的箱数
            vo.setReceiveBoxNumber(0);
            int boxCount = detailsService.boxCount(condition);
            vo.setProductNumber(boxCount);
        }
        int total = baseMapper.selectOrderPurchaseVoPageCountByCondition(condition);
        pageVo.setRecords(listVoTemp);
        pageVo.setTotal(total);
        pageVo.setSize(condition.getPage());
        pageVo.setCurrent(condition.getLimit());
        return pageVo;
    }

    @Override
    public boolean addOrUpdate(OrderPurchaseCommand command, Long operateUserId) {
        SerPurchaseOrderInfo info = getById(command.getPurchaseId());
        boolean flag;
        if (info != null) {
            info.setDealerId(command.getDealerId());
            info.setOrderState(command.getOrderState());
            info.setOrderRemark(command.getRemark());
            if (command.getOperateType() == 1) {
                info.setFinancialId(operateUserId);
            }
            info.setUpdateTime(new Date());
            flag = updateById(info);
        } else {
            info = new SerPurchaseOrderInfo();
            info.setOrderNo(getOrderNum());
            info.setDealerId(command.getDealerId());
            info.setOrderState(0);
            info.setOrderRemark(command.getRemark());
            info.setUserId(operateUserId);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag = save(info);
        }

        if (command.getDetailList().size() > 0) {
            List<SerPurchaseOrderInfoDetails> detailsList = new ArrayList<>();
            detailsService.delete();
            for (OrderDetailVo vo : command.getDetailList()) {
                SerPurchaseOrderInfoDetails details = new SerPurchaseOrderInfoDetails();
                details.setPurchaseId(info.getId());
                details.setBoxNumber(vo.getBoxNumber());
                details.setProductId(vo.getProductId());
                details.setUserId(operateUserId);
                details.setCreateTime(new Date());
                details.setUpdateTime(new Date());
                detailsList.add(details);
            }
            detailsService.saveBatch(detailsList);
        }
        return flag;
    }
}
