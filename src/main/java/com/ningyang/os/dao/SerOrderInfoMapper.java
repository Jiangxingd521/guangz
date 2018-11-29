package com.ningyang.os.dao;

import com.ningyang.os.action.input.condition.serve.QueryOrderCondition;
import com.ningyang.os.action.output.vo.web.serve.SaleOrderVo;
import com.ningyang.os.pojo.SerOrderInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 销售订单表 Mapper 接口
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
public interface SerOrderInfoMapper extends BaseMapper<SerOrderInfo> {

    List<SaleOrderVo> selectSaleOrderVoPageByCondition(QueryOrderCondition condition);

    int selectSaleOrderVoPageCountByCondition(QueryOrderCondition condition);

    List<SaleOrderVo> selectSaleOrderVoListByCondition(QueryOrderCondition condition);

    int selectOrderBoxCount(String orderNo);

}
