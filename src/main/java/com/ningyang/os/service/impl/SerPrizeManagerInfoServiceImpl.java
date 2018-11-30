package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.serve.PrizeManagerCommand;
import com.ningyang.os.action.input.condition.serve.QueryPrizeCondition;
import com.ningyang.os.action.output.vo.web.serve.PrizeManagerVo;
import com.ningyang.os.dao.SerPrizeManagerInfoMapper;
import com.ningyang.os.pojo.SerPrizeManagerInfo;
import com.ningyang.os.service.ISerPrizeManagerInfoService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 奖项管理 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
@Service
public class SerPrizeManagerInfoServiceImpl extends ServiceImpl<SerPrizeManagerInfoMapper, SerPrizeManagerInfo> implements ISerPrizeManagerInfoService {

    @Override
    public List<PrizeManagerVo> findPrizeManagerVoListByCondition(QueryPrizeCondition condition) {
        return baseMapper.selectPrizeManagerVoListByCondition(condition);
    }

    @Override
    public boolean addOrUpdate(PrizeManagerCommand command, Long userId) {
        SerPrizeManagerInfo info = getById(command.getManagerId());
        boolean flag;
        if(info!=null){
            info.setPrizeTypeId(command.getTypeId());
            info.setPrizeName(command.getPrizeName());
            info.setPrizeContent(command.getPrizeContent());
            info.setPrizeRemark(command.getPrizeRemark());
            info.setUserId(userId);
            info.setIdata1(command.getPrizeState());
            info.setUpdateTime(new Date());
            flag = updateById(info);
        }else{
            info = new SerPrizeManagerInfo();
            info.setPrizeTypeId(command.getTypeId());
            info.setPrizeName(command.getPrizeName());
            info.setPrizeContent(command.getPrizeContent());
            info.setPrizeRemark(command.getPrizeRemark());
            info.setUserId(userId);
            info.setIdata1(0);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag = save(info);
        }
        return flag;
    }

}
