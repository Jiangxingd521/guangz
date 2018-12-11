package com.ningyang.os.action.input.condition.base;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/11/14 09:57
 * @描述：溯源码
 */
public class QueryCodeCondition extends BaseCondition {
    //码类型状态
    private Integer codeTypeState;
    //码模板状态
    private Integer codeImportState;
    //码申请状态
    private Integer applyCodeState;
    //产品
    private String productName;
    //系列
    private String seriesName;
    //品牌
    private String brandName;

    public Integer getCodeTypeState() {
        return codeTypeState;
    }

    public void setCodeTypeState(Integer codeTypeState) {
        this.codeTypeState = codeTypeState;
    }

    public Integer getCodeImportState() {
        return codeImportState;
    }

    public void setCodeImportState(Integer codeImportState) {
        this.codeImportState = codeImportState;
    }

    public Integer getApplyCodeState() {
        return applyCodeState;
    }

    public void setApplyCodeState(Integer applyCodeState) {
        this.applyCodeState = applyCodeState;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
