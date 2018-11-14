package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.base.BrandCommand;
import com.ningyang.os.action.input.condition.base.QueryBrandSeriesProductCondition;
import com.ningyang.os.action.output.vo.web.base.BrandVo;
import com.ningyang.os.dao.SerBrandInfoMapper;
import com.ningyang.os.pojo.SerBrandInfo;
import com.ningyang.os.pojo.SerBrandLogoFile;
import com.ningyang.os.service.ISerBrandInfoService;
import com.ningyang.os.service.ISerBrandLogoFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 企业品牌信息 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
@Service
public class SerBrandInfoServiceImpl extends ServiceImpl<SerBrandInfoMapper, SerBrandInfo> implements ISerBrandInfoService {

    @Autowired
    private ISerBrandLogoFileService logoFileService;

    @Override
    public List<BrandVo> findBrandVoByCondition(QueryBrandSeriesProductCondition condition) {
        return baseMapper.selectBrandVoByCondition(condition);
    }

    @Override
    public boolean addOrUpdate(BrandCommand command) {
        SerBrandInfo info = getOne(new QueryWrapper<SerBrandInfo>().eq("id",command.getBrandId()));
        boolean flag1;
        if(info!=null){
            info.setBrandName(command.getBrandName());
            info.setBrandSort(command.getBrandSort());
            info.setBrandRemark(command.getBrandRemark());
            info.setBrandState(command.getBrandState());
            info.setUpdateTime(new Date());
            flag1 = updateById(info);
        }else{
            info = new SerBrandInfo();
            info.setBrandName(command.getBrandName());
            info.setBrandSort(command.getBrandSort());
            info.setBrandRemark(command.getBrandRemark());
            info.setBrandState(0);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag1 = save(info);
        }

        logoFileService.remove(new QueryWrapper<SerBrandLogoFile>().eq("brand_id",command.getBrandId()));
        SerBrandLogoFile logoFile = new SerBrandLogoFile();
        logoFile.setBrandId(info.getId());
        logoFile.setFileId(command.getLogoFile().getId());
        boolean flag2 = logoFileService.save(logoFile);

        return flag1 && flag2;
    }
}
