package com.ningyang.os.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.base.CodeTypeVo;
import com.ningyang.os.pojo.SerCodeTypeInfo;

import java.util.List;


/**
 * <p>
 * 溯源码类型 Mapper 接口
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
public interface SerCodeTypeInfoMapper extends BaseMapper<SerCodeTypeInfo> {

    List<CodeTypeVo> selectCodeTypeVoByCondition(QueryCodeCondition condition);

}
