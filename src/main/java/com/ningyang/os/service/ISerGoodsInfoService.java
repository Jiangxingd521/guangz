package com.ningyang.os.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ningyang.os.action.input.condition.serve.QueryGoodsCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsInfoVo;
import com.ningyang.os.pojo.SerGoodsInfo;

import java.util.List;

/**
 * <p>
 * 商品信息表 服务类
 * </p>
 *
 * @author kaider
 * @since 2018-11-23
 */
public interface ISerGoodsInfoService extends IService<SerGoodsInfo> {

    public List<GoodsInfoVo> findGoodsInfoVoByCondition(QueryGoodsCondition condition);

}
