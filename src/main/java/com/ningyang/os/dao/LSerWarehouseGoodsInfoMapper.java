package com.ningyang.os.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ningyang.os.action.input.condition.serve.QueryGoodsPutCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsPutInVo;
import com.ningyang.os.pojo.LSerWarehouseGoodsInfo;

import java.util.List;

/**
 * <p>
 * 商品入库记录日志 Mapper 接口
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
public interface LSerWarehouseGoodsInfoMapper extends BaseMapper<LSerWarehouseGoodsInfo> {

    List<GoodsPutInVo> selectGoodsPutInVoPageByCondition(QueryGoodsPutCondition condition);

    int selectGoodsPutInVoPageCountByCondition(QueryGoodsPutCondition condition);

    int getWarehouseBoxCount(Long warehouseId);

}
