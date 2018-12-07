package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.api.ApiWarehousePutInCommand;
import com.ningyang.os.action.input.condition.serve.QueryGoodsPutCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsPutInVo;
import com.ningyang.os.dao.LSerWarehouseGoodsInfoMapper;
import com.ningyang.os.pojo.LSerWarehouseGoodsInfo;
import com.ningyang.os.pojo.SerGoodsInfo;
import com.ningyang.os.service.ILSerWarehouseGoodsInfoService;
import com.ningyang.os.service.ISerGoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import static com.ningyang.os.action.utils.DateUtil.getOrderNum;
import static com.ningyang.os.action.utils.DateUtil.timeToStr;
import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.collectingAndThen;
import static java.util.stream.Collectors.toCollection;

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

    @Autowired
    private ISerGoodsInfoService goodsInfoService;

    @Override
    public Map<String,Object> add(ApiWarehousePutInCommand command) {
        List<LSerWarehouseGoodsInfo> safeList = new ArrayList<>();
        List<LSerWarehouseGoodsInfo> unSafeList = new ArrayList<>();
        for (String boxNo : command.getBoxCode()) {
            LSerWarehouseGoodsInfo info;
            //校验是否存在此商品
            SerGoodsInfo goodsInfo = goodsInfoService.getOne(new QueryWrapper<SerGoodsInfo>().eq("M5",boxNo));
            //校验码是否已经已经入库
            List<LSerWarehouseGoodsInfo> listDataTemp = list(new QueryWrapper<LSerWarehouseGoodsInfo>().eq("box_no",boxNo));
            if(listDataTemp.size()>0){
                info = getOne(new QueryWrapper<LSerWarehouseGoodsInfo>().eq("box_no",boxNo));
                unSafeList.add(info);
            }else if(goodsInfo == null) {
                LSerWarehouseGoodsInfo infoTemp = new LSerWarehouseGoodsInfo();
                infoTemp.setBoxNo(boxNo);
                unSafeList.add(infoTemp);
            }else{
                info = new LSerWarehouseGoodsInfo();
                info.setSourceType(command.getSourceType());
                info.setWarehouseId(command.getWarehouse());
                info.setBoxNo(boxNo);
                info.setWarehouseInNo(getOrderNum());
                info.setUserId(command.getUserId());
                info.setWarehouseInTime(new Date());
                info.setRemark(command.getRemark());
                info.setCreateTime(new Date());
                info.setUpdateTime(new Date());
                safeList.add(info);
            }
        }

        //去除数组里面的重复对象
        List<LSerWarehouseGoodsInfo> saveListTemp = safeList.stream().collect(
                collectingAndThen(toCollection(() -> new TreeSet<>(comparing(LSerWarehouseGoodsInfo::getBoxNo))), ArrayList::new)
        );

        //去除数组里面的重复对象
        List<LSerWarehouseGoodsInfo> unSaveListTemp = unSafeList.stream().collect(
                collectingAndThen(toCollection(() -> new TreeSet<>(comparing(LSerWarehouseGoodsInfo::getBoxNo))), ArrayList::new)
        );

        boolean addFlag = saveBatch(saveListTemp);
        Map<String,Object> map = new HashMap<>();
        map.put("saveFlag",addFlag);
        map.put("unSaveFlag",unSaveListTemp);

        return map;
    }

    @Override
    public Page<GoodsPutInVo> findGoodsPutInVoPageByCondition(QueryGoodsPutCondition condition) {
        Page<GoodsPutInVo> pageVo = new Page<>();
        List<GoodsPutInVo> listVoTemp = baseMapper.selectGoodsPutInVoPageByCondition(condition);
        for (GoodsPutInVo vo : listVoTemp) {
            vo.setCreateTimeStr(timeToStr(vo.getCreateTime()));
        }
        int total = baseMapper.selectGoodsPutInVoPageCountByCondition(condition);
        pageVo.setRecords(listVoTemp);
        pageVo.setTotal(total);
        pageVo.setSize(condition.getPage());
        pageVo.setCurrent(condition.getLimit());
        return pageVo;
    }

    @Override
    public int getWarehouseBoxCount(Long warehouseId) {
        return baseMapper.getWarehouseBoxCount(warehouseId);
    }
}
