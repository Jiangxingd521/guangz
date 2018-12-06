package com.ningyang.os.action.input.condition.serve;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/11/30 13:00
 * @描述：会员
 */
public class QueryMemberCondition extends BaseCondition {
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
