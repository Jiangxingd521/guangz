package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.serve.PrizeTypeCommand;
import com.ningyang.os.action.input.condition.serve.QueryPrizeCondition;
import com.ningyang.os.action.output.vo.web.serve.PrizeTypeVo;
import com.ningyang.os.dao.SerPrizeTypeInfoMapper;
import com.ningyang.os.pojo.SerPrizeTypeInfo;
import com.ningyang.os.service.ISerPrizeTypeInfoService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 奖项类型 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
@Service
public class SerPrizeTypeInfoServiceImpl extends ServiceImpl<SerPrizeTypeInfoMapper, SerPrizeTypeInfo> implements ISerPrizeTypeInfoService {

    @Override
    public List<PrizeTypeVo> findPrizeTypeVoListByCondition(QueryPrizeCondition condition) {
        return baseMapper.selectPrizeTypeVoListByCondition(condition);
    }

    @Override
    public boolean addOrUpdate(PrizeTypeCommand command, Long userId) {
        SerPrizeTypeInfo info = getById(command.getTypeId());
        boolean flag;
        if (info != null) {
            info.setPrizeTypeCode(command.getTypeCode());
            info.setPrizeTypeName(command.getTypeName());
            info.setPrizeTypeContent(command.getTypeContent());
            info.setUserId(userId);
            info.setIdata1(command.getTypeState());
            info.setUpdateTime(new Date());
            flag = updateById(info);
        } else {
            info = new SerPrizeTypeInfo();
            info.setPrizeTypeCode(command.getTypeCode());
            info.setPrizeTypeName(command.getTypeName());
            info.setPrizeTypeContent(command.getTypeContent());
            info.setUserId(userId);
            info.setIdata1(0);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag = save(info);
        }
        return flag;
    }
}
