package com.ningyang.os.action.input.condition.base;

/**
 * @Author： kaider
 * @Date：2018/11/14 09:57
 * @描述：码
 */
public class QueryCodeCondition {
    //码类型
    private Integer codeType;
    //码类型状态
    private Integer codeTypeState;
    //码模板状态
    private Integer codeImportState;

    public Integer getCodeType() {
        return codeType;
    }

    public void setCodeType(Integer codeType) {
        this.codeType = codeType;
    }

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
}
