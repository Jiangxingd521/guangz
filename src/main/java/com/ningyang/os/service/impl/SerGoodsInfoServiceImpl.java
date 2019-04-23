package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.condition.serve.QueryGoodsCondition;
import com.ningyang.os.action.output.vo.web.serve.GoodsInfoVo;
import com.ningyang.os.dao.SerGoodsInfoMapper;
import com.ningyang.os.pojo.SerGoodsInfo;
import com.ningyang.os.service.ISerGoodsInfoService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 商品信息表 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-23
 */
@Service
public class SerGoodsInfoServiceImpl extends ServiceImpl<SerGoodsInfoMapper, SerGoodsInfo> implements ISerGoodsInfoService {

    @Override
    public List<GoodsInfoVo> findGoodsInfoVoByCondition(QueryGoodsCondition condition) {
        List<GoodsInfoVo> listVoTemp = baseMapper.selectGoodsInfoVoByCondition(condition);
        return listVoTemp;
    }
}
