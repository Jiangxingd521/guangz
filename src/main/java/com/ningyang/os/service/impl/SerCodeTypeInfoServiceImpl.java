package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.base.CodeTypeCommand;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.base.CodeTypeVo;
import com.ningyang.os.dao.SerCodeTypeInfoMapper;
import com.ningyang.os.pojo.SerCodeTypeInfo;
import com.ningyang.os.service.ISerCodeTypeInfoService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 溯源码类型 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
@Service
public class SerCodeTypeInfoServiceImpl extends ServiceImpl<SerCodeTypeInfoMapper, SerCodeTypeInfo> implements ISerCodeTypeInfoService {


    @Override
    public List<CodeTypeVo> findCodeTypeVoByCondition(QueryCodeCondition condition) {
        return baseMapper.selectCodeTypeVoByCondition(condition);
    }

    @Override
    public boolean addOrUpdate(CodeTypeCommand command) {
        SerCodeTypeInfo info = getOne(new QueryWrapper<SerCodeTypeInfo>().eq("id", command.getCodeId()));
        boolean flag;
        if (info != null) {
            info.setCodeName(command.getCodeName());
            info.setCodeType(command.getCodeType());
            info.setCodeState(command.getCodeState());
            info.setUpdateTime(new Date());
            flag = updateById(info);
        } else {
            info = new SerCodeTypeInfo();
            info.setCodeName(command.getCodeName());
            info.setCodeType(command.getCodeType());
            info.setCodeState(0);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag = save(info);
        }
        return flag;
    }

}
