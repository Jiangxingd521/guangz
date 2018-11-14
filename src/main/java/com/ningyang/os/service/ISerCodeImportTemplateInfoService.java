package com.ningyang.os.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ningyang.os.action.input.command.web.base.CodeImportTemplateCommand;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.base.CodeImportTemplateVo;
import com.ningyang.os.pojo.SerCodeImportTemplateInfo;

import java.util.List;


/**
 * <p>
 * 码导入模板 服务类
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
public interface ISerCodeImportTemplateInfoService extends IService<SerCodeImportTemplateInfo> {

    List<CodeImportTemplateVo> findCodeImportVoByCondition(QueryCodeCondition condition);

    boolean addOrUpdate(CodeImportTemplateCommand command);
}
