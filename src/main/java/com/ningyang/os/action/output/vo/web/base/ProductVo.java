package com.ningyang.os.action.output.vo.web.base;

import com.ningyang.os.action.output.dto.web.FileUploadDto;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/13 18:13
 * @描述：产品
 */
public class ProductVo {

    private String brandName;

    private Long seriesId;

    private String seriesName;

    private Long productId;

    private String productName;

    private int codeNumber;

    private String seriesStandard;

    private BigDecimal marketPrice;

    private BigDecimal salesPrice;

    private String code69;

    private String productRemark;

    private int productState;
    //码类型id
    private List<Long> codeTypeIds;

    private List<FileUploadDto> productFileList;

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Long getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(Long seriesId) {
        this.seriesId = seriesId;
    }

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCodeNumber() {
        return codeNumber;
    }

    public void setCodeNumber(int codeNumber) {
        this.codeNumber = codeNumber;
    }

    public String getSeriesStandard() {
        return seriesStandard;
    }

    public void setSeriesStandard(String seriesStandard) {
        this.seriesStandard = seriesStandard;
    }

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public BigDecimal getSalesPrice() {
        return salesPrice;
    }

    public void setSalesPrice(BigDecimal salesPrice) {
        this.salesPrice = salesPrice;
    }

    public String getCode69() {
        return code69;
    }

    public void setCode69(String code69) {
        this.code69 = code69;
    }

    public String getProductRemark() {
        return productRemark;
    }

    public void setProductRemark(String productRemark) {
        this.productRemark = productRemark;
    }

    public int getProductState() {
        return productState;
    }

    public void setProductState(int productState) {
        this.productState = productState;
    }

    public List<Long> getCodeTypeIds() {
        return codeTypeIds;
    }

    public void setCodeTypeIds(List<Long> codeTypeIds) {
        this.codeTypeIds = codeTypeIds;
    }

    public List<FileUploadDto> getProductFileList() {
        return productFileList;
    }

    public void setProductFileList(List<FileUploadDto> productFileList) {
        this.productFileList = productFileList;
    }
}
