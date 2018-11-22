package com.ningyang.os.action.input.condition.base;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/11/14 09:57
 * @描述：溯源码
 */
public class QueryCodeCondition extends BaseCondition {
    //码类型
    private Integer codeType;
    //码类型状态
    private Integer codeTypeState;
    //码模板状态
    private Integer codeImportState;
    //码申请状态
    private Integer applyCodeState;

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

    public Integer getApplyCodeState() {
        return applyCodeState;
    }

    public void setApplyCodeState(Integer applyCodeState) {
        this.applyCodeState = applyCodeState;
    }

}
