package com.ningyang.os.action.input.command.web.base;

import java.math.BigDecimal;

/**
 * @Author： kaider
 * @Date：2018/11/13 18:41
 * @描述：产品
 */
public class ProductCommand {

    private Long productId;

    private String productName;

    private Long seriesId;

    private int codeNumber;

    private String seriesStandard;

    private BigDecimal marketPrice;

    private BigDecimal salesPrice;

    private String code69;

    private String seriesRemark;

    private int productState;

    private Long[] productFileIds;

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

    public Long getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(Long seriesId) {
        this.seriesId = seriesId;
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

    public String getSeriesRemark() {
        return seriesRemark;
    }

    public void setSeriesRemark(String seriesRemark) {
        this.seriesRemark = seriesRemark;
    }

    public int getProductState() {
        return productState;
    }

    public void setProductState(int productState) {
        this.productState = productState;
    }

    public Long[] getProductFileIds() {
        return productFileIds;
    }

    public void setProductFileIds(Long[] productFileIds) {
        this.productFileIds = productFileIds;
    }
}
