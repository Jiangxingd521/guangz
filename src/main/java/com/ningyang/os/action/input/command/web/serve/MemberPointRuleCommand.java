package com.ningyang.os.action.input.command.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/30 13:04
 * @描述：会员积分规则
 */
public class MemberPointRuleCommand {

    private Long ruleId;

    private String ruleName;

    private int ruleValue;

    private Long userId;

    private int ruleState = 0;

    public Long getRuleId() {
        return ruleId;
    }

    public void setRuleId(Long ruleId) {
        this.ruleId = ruleId;
    }

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    public int getRuleValue() {
        return ruleValue;
    }

    public void setRuleValue(int ruleValue) {
        this.ruleValue = ruleValue;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public int getRuleState() {
        return ruleState;
    }

    public void setRuleState(int ruleState) {
        this.ruleState = ruleState;
    }
}
