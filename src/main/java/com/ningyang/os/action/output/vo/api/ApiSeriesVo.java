package com.ningyang.os.action.output.vo.api;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/12/06 14:39
 * @描述：品牌系列产品
 */
public class ApiSeriesVo {

    private Long seriesId;

    private String seriesName;

    private List<ApiProductVo> productListVo;

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

    public List<ApiProductVo> getProductListVo() {
        return productListVo;
    }

    public void setProductListVo(List<ApiProductVo> productListVo) {
        this.productListVo = productListVo;
    }
}
