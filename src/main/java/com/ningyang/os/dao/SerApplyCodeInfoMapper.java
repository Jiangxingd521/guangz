package com.ningyang.os.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.serve.ApplyCodeVo;
import com.ningyang.os.pojo.SerApplyCodeInfo;

import java.util.List;

/**
 * <p>
 * 溯源码申请 Mapper 接口
 * </p>
 *
 * @author kaider
 * @since 2018-11-15
 */
public interface SerApplyCodeInfoMapper extends BaseMapper<SerApplyCodeInfo> {

    List<ApplyCodeVo> selectApplyCodeVoPageByCondition(QueryCodeCondition condition);

    Long selectApplyCodeVoPageCountByCondition(QueryCodeCondition condition);

    List<ApplyCodeVo> selectApplyCodeVoSimplifiedPageByCondition(QueryCodeCondition condition);

    List<ApplyCodeVo> selectApplyCodeVoListByCondition(QueryCodeCondition condition);

    Long selectApplyCodeVoSimplifiedPageCountByCondition(QueryCodeCondition condition);

}
