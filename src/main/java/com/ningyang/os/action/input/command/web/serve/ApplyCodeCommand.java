package com.ningyang.os.action.input.command.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/15 18:07
 * @描述：溯源码申请
 */
public class ApplyCodeCommand {

    private Long applyId;

    private Long applyUserId;

    private Long codeTypeId;

    private Long codePositionId;

    private Integer applyCount;

    public Long getApplyId() {
        return applyId;
    }

    public void setApplyId(Long applyId) {
        this.applyId = applyId;
    }

    public Long getApplyUserId() {
        return applyUserId;
    }

    public void setApplyUserId(Long applyUserId) {
        this.applyUserId = applyUserId;
    }

    public Long getCodeTypeId() {
        return codeTypeId;
    }

    public void setCodeTypeId(Long codeTypeId) {
        this.codeTypeId = codeTypeId;
    }

    public Long getCodePositionId() {
        return codePositionId;
    }

    public void setCodePositionId(Long codePositionId) {
        this.codePositionId = codePositionId;
    }

    public Integer getApplyCount() {
        return applyCount;
    }

    public void setApplyCount(Integer applyCount) {
        this.applyCount = applyCount;
    }
}
