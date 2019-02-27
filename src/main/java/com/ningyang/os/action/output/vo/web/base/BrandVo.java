package com.ningyang.os.action.output.vo.web.base;

import com.ningyang.os.action.output.dto.web.FileUploadDto;
import lombok.Data;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/13 14:37
 * @描述：品牌
 */
@Data
public class BrandVo {
    //品牌id
    private Long brandId;
    //品牌名称
    private String brandName;
    //品牌排序
    private int brandSort;
    //品牌说明
    private String brandRemark;
    //品牌状态
    private int brandState;
    //品牌logo文件
    private List<FileUploadDto> logoFile;
}
