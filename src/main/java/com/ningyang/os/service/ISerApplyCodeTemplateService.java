package com.ningyang.os.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ningyang.os.action.input.command.web.serve.CenterCodeCommand;
import com.ningyang.os.pojo.SerApplyCodeTemplate;

/**
 * @Author： kaider
 * @Date：2018/11/20 15:17
 * @描述：
 */
public interface ISerApplyCodeTemplateService extends IService<SerApplyCodeTemplate> {

    boolean addBatch(CenterCodeCommand command);

//    List<CompanyApplyCodeVo> findCodeVoList(Long companyId, String applyOrder);
}
