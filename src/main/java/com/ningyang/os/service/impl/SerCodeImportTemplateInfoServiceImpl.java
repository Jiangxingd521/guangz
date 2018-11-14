package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.base.CodeImportTemplateCommand;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.base.CodeImportTemplateVo;
import com.ningyang.os.dao.SerCodeImportTemplateInfoMapper;
import com.ningyang.os.pojo.SerCodeImportTemplateInfo;
import com.ningyang.os.service.ISerCodeImportTemplateInfoService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 码导入模板 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
@Service
public class SerCodeImportTemplateInfoServiceImpl extends ServiceImpl<SerCodeImportTemplateInfoMapper, SerCodeImportTemplateInfo> implements ISerCodeImportTemplateInfoService {

    @Override
    public List<CodeImportTemplateVo> findCodeImportVoByCondition(QueryCodeCondition condition) {
        return baseMapper.selectCodeImportVoByCondition(condition);
    }

    @Override
    public boolean addOrUpdate(CodeImportTemplateCommand command) {
        SerCodeImportTemplateInfo info = getOne(new QueryWrapper<SerCodeImportTemplateInfo>()
                .eq("id",command.getTemplateId()));
        boolean flag;
        if(info!=null){
            info.setProductId(command.getProductId());
            info.setTemplateName(command.getTemplateName());
            info.setLeftCodeTypeId(command.getLeftCodeId());
            info.setRightCodeTypeId(command.getRightCodeId());
            info.setTemplateRemark(command.getTemplateRemark());
            info.setTemplateState(command.getTemplateState());
            info.setUpdateTime(new Date());
            flag = updateById(info);
        }else{
            info = new SerCodeImportTemplateInfo();
            info.setProductId(command.getProductId());
            info.setTemplateName(command.getTemplateName());
            info.setLeftCodeTypeId(command.getLeftCodeId());
            info.setRightCodeTypeId(command.getRightCodeId());
            info.setTemplateRemark(command.getTemplateRemark());
            info.setTemplateState(0);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag = save(info);
        }
        return flag;
    }
}
