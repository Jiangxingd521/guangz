package com.ningyang.os.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ningyang.os.action.input.condition.serve.QueryGoodsCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsInfoVo;
import com.ningyang.os.pojo.SerGoodsInfo;

import java.util.List;

/**
 * <p>
 * 商品信息表 Mapper 接口
 * </p>
 *
 * @author kaider
 * @since 2018-11-23
 */
public interface SerGoodsInfoMapper extends BaseMapper<SerGoodsInfo> {

    List<GoodsInfoVo> selectGoodsInfoVoByCondition(QueryGoodsCondition condition);

}
