package com.ningyang.os.action.output.vo.api;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/12/06 14:37
 * @描述：品牌系列产品
 */
public class ApiBrandSeriesProductVo {

    private String brandName;

    private List<ApiSeriesVo> seriesListVo;

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public List<ApiSeriesVo> getSeriesListVo() {
        return seriesListVo;
    }

    public void setSeriesListVo(List<ApiSeriesVo> seriesListVo) {
        this.seriesListVo = seriesListVo;
    }
}
