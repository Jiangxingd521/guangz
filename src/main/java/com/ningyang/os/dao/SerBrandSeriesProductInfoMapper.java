package com.ningyang.os.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ningyang.os.action.input.condition.base.QueryBrandSeriesProductCondition;
import com.ningyang.os.action.output.vo.web.base.BrandSeriesProductVo;
import com.ningyang.os.action.output.vo.web.base.ProductVo;
import com.ningyang.os.pojo.SerBrandSeriesProductInfo;

import java.util.List;


/**
 * <p>
 * 品牌系列产品信息 Mapper 接口
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
public interface SerBrandSeriesProductInfoMapper extends BaseMapper<SerBrandSeriesProductInfo> {

    List<ProductVo> selectProductVoByCondition(QueryBrandSeriesProductCondition condition);

    BrandSeriesProductVo selectBrandSeriesProductVo(Long productId);

}
