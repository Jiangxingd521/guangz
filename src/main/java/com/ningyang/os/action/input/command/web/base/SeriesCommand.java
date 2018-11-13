package com.ningyang.os.action.input.command.web.base;

/**
 * @Author： kaider
 * @Date：2018/11/13 17:20
 * @描述：系列
 */
public class SeriesCommand {
    //
    private Long seriesId;
    //
    private String seriesName;
    //
    private Long brandId;
    //
    private String brandName;
    //
    private String seriesRemark;
    //
    private int seriesState;

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
