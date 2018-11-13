package com.ningyang.os.action.input.condition.base;

/**
 * @Author： kaider
 * @Date：2018/11/13 14:33
 * @描述：品牌产品系列
 */
public class QueryBrandSeriesProductCondition {
    //品牌id
    private Long brandId;
    //品牌状态
    private Integer brandState;
    //系列id
    private Long seriesId;
    //系列状态
    private Integer seriesState;
    //产品id
    private Long productId;
    //产品状态
    private Integer productState;

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Integer getBrandState() {
        return brandState;
    }

    public void setBrandState(Integer brandState) {
        this.brandState = brandState;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Integer getProductState() {
        return productState;
    }

    public void setProductState(Integer productState) {
        this.productState = productState;
    }

    public Long getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(Long seriesId) {
        this.seriesId = seriesId;
    }

    public Integer getSeriesState() {
        return seriesState;
    }

    public void setSeriesState(Integer seriesState) {
        this.seriesState = seriesState;
    }
}
