package com.ningyang.os.action.output.vo.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/30 13:01
 * @描述：会员积分规则
 */
public class MemberPointRuleVo {

    private Long ruleId;

    private String ruleName;

    private String ruleValue;

    private String userName;

    private int ruleState;

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

    public String getRuleValue() {
        return ruleValue;
    }

    public void setRuleValue(String ruleValue) {
        this.ruleValue = ruleValue;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getRuleState() {
        return ruleState;
    }

    public void setRuleState(int ruleState) {
        this.ruleState = ruleState;
    }
}
