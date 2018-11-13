package com.ningyang.os.action.output.vo.web.base;

/**
 * @Author： kaider
 * @Date：2018/11/13 17:07
 * @描述：系列
 */
public class SeriesVo {
    //品牌
    private Long brandId;
    //品牌
    private String brandName;
    //系列
    private Long seriesId;
    //系列
    private String seriesName;
    //备注
    private String seriesRemark;
    //产品状态
    private int seriesState;

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Long getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(Long seriesId) {
        this.seriesId = seriesId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    public String getSeriesRemark() {
        return seriesRemark;
    }

    public void setSeriesRemark(String seriesRemark) {
        this.seriesRemark = seriesRemark;
    }

    public int getSeriesState() {
        return seriesState;
    }

    public void setSeriesState(int seriesState) {
        this.seriesState = seriesState;
    }
}
