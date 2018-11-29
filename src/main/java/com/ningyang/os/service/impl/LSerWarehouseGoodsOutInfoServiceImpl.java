package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutOutCommand;
import com.ningyang.os.action.input.condition.serve.QueryGoodsPutCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsPutOutVo;
import com.ningyang.os.dao.LSerWarehouseGoodsOutInfoMapper;
import com.ningyang.os.pojo.LSerWarehouseGoodsOutInfo;
import com.ningyang.os.service.ILSerWarehouseGoodsOutInfoService;
import com.ningyang.os.service.ISerOrderInfoDetailsService;
import com.ningyang.os.service.ISerOrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.ningyang.os.action.utils.DateUtil.timeToStr;

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

    @Override
    public Page<GoodsPutOutVo> findGoodsPutOutVoPageByCondition(QueryGoodsPutCondition condition) {
        Page<GoodsPutOutVo> pageVo = new Page<>();
        List<GoodsPutOutVo> listVoTemp = baseMapper.selectGoodsPutOutVoPageByCondition(condition);
        for(GoodsPutOutVo vo : listVoTemp){
            vo.setGoodsOutTimeStr(timeToStr(vo.getGoodsOutTime()));
            int orderBoxCount = orderInfoService.getOrderBoxCount(vo.getOrderNo());
            vo.setOrderBoxCount(orderBoxCount);
        }
        int total = baseMapper.selectGoodsPutOutVoPageCountByCondition(condition);
        pageVo.setRecords(listVoTemp);
        pageVo.setTotal(total);
        pageVo.setSize(condition.getPage());
        pageVo.setCurrent(condition.getLimit());
        return pageVo;
    }
}
