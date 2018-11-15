package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.serve.WarehouseCommand;
import com.ningyang.os.action.input.condition.serve.QueryWarehouseCondition;
import com.ningyang.os.action.output.vo.web.serve.WarehousePersonVo;
import com.ningyang.os.action.output.vo.web.serve.WarehouseVo;
import com.ningyang.os.dao.SerWarehouseInfoMapper;
import com.ningyang.os.pojo.SerWarehouseInfo;
import com.ningyang.os.service.ISerWarehouseInfoService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 仓库信息 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
@Service
public class SerWarehouseInfoServiceImpl extends ServiceImpl<SerWarehouseInfoMapper, SerWarehouseInfo> implements ISerWarehouseInfoService {

    @Override
    public Page<WarehouseVo> findWarehouseVoPageByCondition(QueryWarehouseCondition condition) {
        Page<WarehouseVo> pageVo = new Page<>();
        List<WarehouseVo> listVoTemp = baseMapper.selectWarehouseVoPageByCondition(condition);
        int total = baseMapper.selectWarehouseVoPageCountByCondition(condition);
        pageVo.setRecords(listVoTemp);
        pageVo.setTotal(total);
        pageVo.setSize(condition.getPage());
        pageVo.setCurrent(condition.getLimit());
        return pageVo;
    }

    @Override
    public boolean addOrUpdate(WarehouseCommand command) {
        SerWarehouseInfo info = getOne(new QueryWrapper<SerWarehouseInfo>().eq("id",command.getWarehouseId()));
        boolean flag;
        if(info!=null){
            info.setWarehouseName(command.getWarehouseName());
            info.setUserId(command.getWarehouseUserId());
            info.setWarehousePerson(command.getWarehousePerson());
            info.setWarehousePersonMobile(command.getWarehousePersonMobile());
            info.setTotalInventory(command.getTotalInventory());
            info.setWarehouseRemark(command.getWarehouseRemark());
            info.setWarehouseState(command.getWarehouseState());
            info.setUpdateTime(new Date());
            flag = updateById(info);
        }else{
            info = new SerWarehouseInfo();
            info.setWarehouseName(command.getWarehouseName());
            info.setUserId(command.getWarehouseUserId());
            info.setWarehousePerson(command.getWarehousePerson());
            info.setWarehousePersonMobile(command.getWarehousePersonMobile());
            info.setTotalInventory(command.getTotalInventory());
            info.setWarehouseRemark(command.getWarehouseRemark());
            info.setWarehouseState(0);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag = save(info);
        }
        return flag;
    }

    @Override
    public List<WarehousePersonVo> findWarehousePersonVoByCondition() {
        return baseMapper.selectWarehousePersonVoByCondition();
    }
}
