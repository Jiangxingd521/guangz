package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.config.SystemConfig;
import com.ningyang.os.action.input.command.web.serve.ApplyCodeCommand;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.output.vo.web.serve.ApplyCodeVo;
import com.ningyang.os.dao.SerApplyCodeInfoMapper;
import com.ningyang.os.pojo.SerApplyCodeInfo;
import com.ningyang.os.service.ISerApplyCodeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

import static com.ningyang.suyuan.node.action.utils.DateUtil.getOrderNum;

/**
 * <p>
 * 溯源码申请 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-15
 */
@Service
public class SerApplyCodeInfoServiceImpl extends ServiceImpl<SerApplyCodeInfoMapper, SerApplyCodeInfo> implements ISerApplyCodeInfoService {

    @Autowired
    private SystemConfig config;


    @Override
    public Page<ApplyCodeVo> findApplyCodeVoPageByCondition(QueryCodeCondition condition) {
        Page<ApplyCodeVo> pageVo = new Page<>();
        List<ApplyCodeVo> listVoTemp = baseMapper.selectApplyCodeVoPageByCondition(condition);
        int total = baseMapper.selectApplyCodeVoPageCountByCondition(condition);
        pageVo.setRecords(listVoTemp);
        pageVo.setTotal(total);
        pageVo.setSize(condition.getPage());
        pageVo.setCurrent(condition.getLimit());
        return pageVo;
    }

    // FIXME: 2018/11/15 企业向中心发送请求
    @Override
    public boolean add(ApplyCodeCommand command) {
        SerApplyCodeInfo info = new SerApplyCodeInfo();
        info.setApplyNo(getOrderNum());
        info.setApplyUserId(command.getApplyUserId());
        info.setCodeTypeId(command.getCodeTypeId());
        info.setCodePositionId(command.getCodePositionId());
        info.setApplyCount(command.getApplyCount());
        info.setApplyState(0);
        info.setCreateTime(new Date());
        info.setUpdateTime(new Date());
        boolean flag1 = save(info);
        return flag1;
    }
}
