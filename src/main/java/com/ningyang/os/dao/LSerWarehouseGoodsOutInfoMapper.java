package com.ningyang.os.dao;

import com.ningyang.os.action.input.condition.serve.QueryGoodsPutCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsPutOutVo;
import com.ningyang.os.pojo.LSerWarehouseGoodsOutInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 商品出库记录日志 Mapper 接口
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
public interface LSerWarehouseGoodsOutInfoMapper extends BaseMapper<LSerWarehouseGoodsOutInfo> {

    List<GoodsPutOutVo> selectGoodsPutOutVoPageByCondition(QueryGoodsPutCondition condition);

    int selectGoodsPutOutVoPageCountByCondition(QueryGoodsPutCondition condition);

}
