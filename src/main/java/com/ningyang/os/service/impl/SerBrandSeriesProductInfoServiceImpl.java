package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.base.ProductCommand;
import com.ningyang.os.action.input.condition.base.QueryBrandSeriesProductCondition;
import com.ningyang.os.action.output.vo.web.base.ProductVo;
import com.ningyang.os.dao.SerBrandSeriesProductInfoMapper;
import com.ningyang.os.pojo.SerBrandSeriesProductFile;
import com.ningyang.os.pojo.SerBrandSeriesProductInfo;
import com.ningyang.os.service.ISerBrandSeriesProductFileService;
import com.ningyang.os.service.ISerBrandSeriesProductInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 品牌系列产品信息 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
@Service
public class SerBrandSeriesProductInfoServiceImpl extends ServiceImpl<SerBrandSeriesProductInfoMapper, SerBrandSeriesProductInfo> implements ISerBrandSeriesProductInfoService {

    @Autowired
    private ISerBrandSeriesProductFileService productFileService;

    @Override
    public List<ProductVo> findProductVoByCondition(QueryBrandSeriesProductCondition condition) {
        return baseMapper.selectProductVoByCondition(condition);
    }

    @Override
    public boolean addOrUpdate(ProductCommand command) {
        SerBrandSeriesProductInfo info = getOne(new QueryWrapper<SerBrandSeriesProductInfo>().eq("id",command.getProductId()));
        boolean flag1;
        if(info!=null){
            info.setSeriesId(command.getSeriesId());
            info.setProductName(command.getProductName());
            info.setCodeNumber(command.getCodeNumber());
            info.setSeriesStandard(command.getSeriesStandard());
            info.setMarketPrice(command.getMarketPrice());
            info.setSalesPrice(command.getSalesPrice());
            info.setCode69(command.getCode69());
            info.setProductRemark(command.getSeriesRemark());
            info.setProductState(command.getCodeNumber());
            info.setUpdateTime(new Date());
            flag1 = updateById(info);
        }else{
            info = new SerBrandSeriesProductInfo();
            info.setSeriesId(command.getSeriesId());
            info.setProductName(command.getProductName());
            info.setCodeNumber(command.getCodeNumber());
            info.setSeriesStandard(command.getSeriesStandard());
            info.setMarketPrice(command.getMarketPrice());
            info.setSalesPrice(command.getSalesPrice());
            info.setCode69(command.getCode69());
            info.setProductRemark(command.getSeriesRemark());
            info.setProductState(0);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag1 = save(info);
        }

        productFileService.remove(new QueryWrapper<SerBrandSeriesProductFile>().eq("product_id",info.getId()));
        List<SerBrandSeriesProductFile> fileList = new ArrayList<>();
        for(Long fileId : command.getProductFileIds()){
            SerBrandSeriesProductFile productFile = new SerBrandSeriesProductFile();
            productFile.setProductId(info.getId());
            productFile.setFileId(fileId);
            fileList.add(productFile);
        }
        boolean flag2 = productFileService.saveBatch(fileList);

        return flag1 && flag2;
    }
}
