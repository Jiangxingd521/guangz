package com.ningyang.os.action.input.condition.serve;

/**
 * @Author： kaider
 * @Date：2018/11/30 13:00
 * @描述：会员
 */
public class QueryMemberCondition {
    //规则状态
    private Integer ruleState;
    //类型状态
    private Integer typeState;

    public Integer getRuleState() {
        return ruleState;
    }

    public void setRuleState(Integer ruleState) {
        this.ruleState = ruleState;
    }

    public Integer getTypeState() {
        return typeState;
    }

    public void setTypeState(Integer typeState) {
        this.typeState = typeState;
    }
}
