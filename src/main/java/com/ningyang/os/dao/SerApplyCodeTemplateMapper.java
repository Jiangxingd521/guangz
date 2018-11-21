package com.ningyang.os.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ningyang.os.action.input.command.web.serve.TemplateCodeCommand;
import com.ningyang.os.pojo.SerApplyCodeTemplate;

/**
 * @Author： kaider
 * @Date：2018/11/20 15:12
 * @描述：溯源码申请
 */
public interface SerApplyCodeTemplateMapper extends BaseMapper<SerApplyCodeTemplate> {

    boolean insertBatch(TemplateCodeCommand command);

//    List<CompanyApplyCodeVo> selectCodeVoList(QueryApplyCodeCondition condition);

}
