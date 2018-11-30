package com.ningyang.os.action.output.vo.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/30 13:17
 * @描述：会员类型
 */
public class MemberTypeVo {

    private Long typeId;

    private Long ruleId;

    private String ruleName;

    private String typeName;

    private int typeQuanty;

    private String userName;

    private int typeState;

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

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

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getTypeQuanty() {
        return typeQuanty;
    }

    public void setTypeQuanty(int typeQuanty) {
        this.typeQuanty = typeQuanty;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getTypeState() {
        return typeState;
    }

    public void setTypeState(int typeState) {
        this.typeState = typeState;
    }
}
