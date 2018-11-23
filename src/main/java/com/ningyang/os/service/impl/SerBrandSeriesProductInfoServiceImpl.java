package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.input.command.web.base.ProductCommand;
import com.ningyang.os.action.input.condition.base.QueryBrandSeriesProductCondition;
import com.ningyang.os.action.output.dto.web.FileUploadDto;
import com.ningyang.os.action.output.vo.web.base.BrandSeriesProductVo;
import com.ningyang.os.action.output.vo.web.base.ProductVo;
import com.ningyang.os.dao.SerBrandSeriesProductInfoMapper;
import com.ningyang.os.pojo.SerBrandSeriesProductCodeInfo;
import com.ningyang.os.pojo.SerBrandSeriesProductFile;
import com.ningyang.os.pojo.SerBrandSeriesProductInfo;
import com.ningyang.os.pojo.SysFileInfo;
import com.ningyang.os.service.ISerBrandSeriesProductCodeInfoService;
import com.ningyang.os.service.ISerBrandSeriesProductFileService;
import com.ningyang.os.service.ISerBrandSeriesProductInfoService;
import com.ningyang.os.service.ISysFileInfoService;
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
    @Autowired
    private ISerBrandSeriesProductCodeInfoService codeInfoService;
    @Autowired
    private ISysFileInfoService fileService;

    @Override
    public List<ProductVo> findProductVoByCondition(QueryBrandSeriesProductCondition condition) {
        List<ProductVo> list = baseMapper.selectProductVoByCondition(condition);
        for (ProductVo vo : list) {
            List<Long> productCodeIdList = codeInfoService.getProductCodeIds(vo.getProductId());
            int codeNumber = productCodeIdList.size();
            vo.setCodeNumber(codeNumber);
            vo.setCodeTypeIds(productCodeIdList);

            List<SerBrandSeriesProductFile> productFileList = productFileService.list(new QueryWrapper<SerBrandSeriesProductFile>()
                    .eq("product_id", vo.getProductId()));

            List<FileUploadDto> fileList = new ArrayList<>();
            for (SerBrandSeriesProductFile productFile : productFileList) {
                Long fileId = productFile.getFileId();
                SysFileInfo fileInfo = fileService.getById(fileId);
                FileUploadDto dto = new FileUploadDto();
                dto.setId(fileId);
                dto.setName(fileInfo.getFileName());
                dto.setStatus("success");
                dto.setUid(fileId);
                dto.setUrl(fileInfo.getFilePath());
                fileList.add(dto);
            }
            vo.setProductFileList(fileList);
        }
        return list;
    }

    @Override
    public boolean addOrUpdate(ProductCommand command) {
        SerBrandSeriesProductInfo info = getOne(new QueryWrapper<SerBrandSeriesProductInfo>().eq("id", command.getProductId()));
        boolean flag1;
        if (info != null) {
            info.setSeriesId(command.getSeriesId());
            info.setProductName(command.getProductName());
            info.setSeriesStandard(command.getSeriesStandard());
            info.setMarketPrice(command.getMarketPrice());
            info.setSalesPrice(command.getSalesPrice());
            info.setCode69(command.getCode69());
            info.setProductRemark(command.getProductRemark());
            info.setProductState(command.getProductState());
            info.setUpdateTime(new Date());
            flag1 = updateById(info);
        } else {
            info = new SerBrandSeriesProductInfo();
            info.setSeriesId(command.getSeriesId());
            info.setProductName(command.getProductName());
            info.setSeriesStandard(command.getSeriesStandard());
            info.setMarketPrice(command.getMarketPrice());
            info.setSalesPrice(command.getSalesPrice());
            info.setCode69(command.getCode69());
            info.setProductRemark(command.getProductRemark());
            info.setProductState(0);
            info.setCreateTime(new Date());
            info.setUpdateTime(new Date());
            flag1 = save(info);
        }

        codeInfoService.remove(new QueryWrapper<SerBrandSeriesProductCodeInfo>().eq("product_id", info.getId()));
        List<SerBrandSeriesProductCodeInfo> productCodeInfoList = new ArrayList<>();
        for (Long codeTypeId : command.getCodeTypeIds()) {
            SerBrandSeriesProductCodeInfo productCodeInfo = new SerBrandSeriesProductCodeInfo();
            productCodeInfo.setProductId(info.getId());
            productCodeInfo.setCodeId(codeTypeId);
            productCodeInfoList.add(productCodeInfo);
        }
        boolean flag2 = codeInfoService.saveBatch(productCodeInfoList);

        productFileService.remove(new QueryWrapper<SerBrandSeriesProductFile>().eq("product_id", info.getId()));
        List<SerBrandSeriesProductFile> fileList = new ArrayList<>();
        for (FileUploadDto fileDto : command.getProductFileList()) {
            SerBrandSeriesProductFile productFile = new SerBrandSeriesProductFile();
            productFile.setProductId(info.getId());
            productFile.setFileId(fileDto.getId());
            fileList.add(productFile);
        }
        boolean flag3 = productFileService.saveBatch(fileList);

        return flag1 && flag2 && flag3;
    }

    @Override
    public BrandSeriesProductVo findBrandSeriesProductVo(Long productId) {
        return baseMapper.selectBrandSeriesProductVo(productId);
    }
}
