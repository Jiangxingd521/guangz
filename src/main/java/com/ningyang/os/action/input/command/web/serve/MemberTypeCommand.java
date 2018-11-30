package com.ningyang.os.action.input.command.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/30 13:13
 * @描述：会员类型
 */
public class MemberTypeCommand {

    private Long typeId;

    private Long ruleId;

    private String typeName;

    private int typeQuanty;

    private Long userId;

    private int typeState=0;

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

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public int getTypeState() {
        return typeState;
    }

    public void setTypeState(int typeState) {
        this.typeState = typeState;
    }
}
