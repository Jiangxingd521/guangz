package com.ningyang.os.action.input.command.web.base;

import com.ningyang.os.action.output.dto.web.FileUploadDto;

/**
 * @Author： kaider
 * @Date：2018/11/13 14:58
 * @描述：品牌
 */
public class BrandCommand {

    private Long brandId;

    private String brandName;

    private int brandSort;

    private String brandRemark;

    private int brandState;

    private FileUploadDto logoFile;

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getBrandSort() {
        return brandSort;
    }

    public void setBrandSort(int brandSort) {
        this.brandSort = brandSort;
    }

    public String getBrandRemark() {
        return brandRemark;
    }

    public void setBrandRemark(String brandRemark) {
        this.brandRemark = brandRemark;
    }

    public int getBrandState() {
        return brandState;
    }

    public void setBrandState(int brandState) {
        this.brandState = brandState;
    }

    public FileUploadDto getLogoFile() {
        return logoFile;
    }

    public void setLogoFile(FileUploadDto logoFile) {
        this.logoFile = logoFile;
    }
}
