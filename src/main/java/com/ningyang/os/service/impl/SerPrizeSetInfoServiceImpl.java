package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.serve.PrizeSetCommand;
import com.ningyang.os.action.input.condition.serve.QueryPrizeCondition;
import com.ningyang.os.action.output.vo.web.serve.PrizeSetVo;
import com.ningyang.os.dao.SerPrizeSetInfoMapper;
import com.ningyang.os.pojo.SerPrizeSetInfo;
import com.ningyang.os.service.ISerPrizeSetInfoService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 奖项设定 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
@Service
public class SerPrizeSetInfoServiceImpl extends ServiceImpl<SerPrizeSetInfoMapper, SerPrizeSetInfo> implements ISerPrizeSetInfoService {

    @Override
    public List<PrizeSetVo> findPrizeSetVoListByCondition(QueryPrizeCondition condition) {
        return baseMapper.selectPrizeSetVoListByCondition(condition);
    }

    @Override
    public boolean addOrUpdate(PrizeSetCommand command, Long userId) {
        SerPrizeSetInfo info = getById(command.getPrizeSetId());
        boolean flag;
        if(info!=null){
            info.setPrizeManagerId(command.getManagerId());
            info.setPrizeSetName(command.getPrizeSetName());
            info.setProdId(command.getProdId());
            info.setMemberType(command.getMemberType());
            info.setRegionId(command.getRegionId());
            info.setPrizeQuantity(command.getPrizeQuantity());
            info.setMoney(command.getMoney());
            info.setMoneyEnd(command.getMoneyEnd());
            info.setPonit(command.getPonit());
            info.setPointEnd(command.getPointEnd());
            info.setPrizeSetType(command.getPrizeSetType());
            info.setPrizeModeType(command.getPrizeModeType());
            info.setCardMoney(command.getCardMoney());
            info.setCardCouponMoney(command.getCardCouponMoney());
            info.setPrizeStartDate(command.getPrizeDate()[0]);
            info.setPrizeEndDate(command.getPrizeDate()[1]);
            info.setIdata1(command.getSetState());
            info.setUserId(userId);
            flag = updateById(info);
        }else{
            info = new SerPrizeSetInfo();
            info.setPrizeManagerId(command.getManagerId());
            info.setPrizeSetName(command.getPrizeSetName());
            info.setProdId(command.getProdId());
            info.setMemberType(command.getMemberType());
            info.setRegionId(command.getRegionId());
            info.setPrizeQuantity(command.getPrizeQuantity());
            info.setMoney(command.getMoney());
            info.setMoneyEnd(command.getMoneyEnd());
            info.setPonit(command.getPonit());
            info.setPointEnd(command.getPointEnd());
            info.setPrizeSetType(command.getPrizeSetType());
            info.setPrizeModeType(command.getPrizeModeType());
            info.setCardMoney(command.getCardMoney());
            info.setCardCouponMoney(command.getCardCouponMoney());
            info.setPrizeStartDate(command.getPrizeDate()[0]);
            info.setPrizeEndDate(command.getPrizeDate()[1]);
            info.setIdata1(0);
            info.setUserId(userId);
            flag = save(info);
        }
        return flag;
    }
}
