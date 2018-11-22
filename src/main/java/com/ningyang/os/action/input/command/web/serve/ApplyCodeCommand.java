package com.ningyang.os.action.input.command.web.serve;

import com.ningyang.os.action.input.command.base.ApiCommand;

/**
 * @Author： kaider
 * @Date：2018/11/15 18:07
 * @描述：溯源码申请
 */
public class ApplyCodeCommand extends ApiCommand {
    //
    private Long applyId;
    //申请人
    private Long applyUserId;
    //码类型
    private Long codeType;
    //码位置
    private Long codePosition;
    //码数量
    private Integer applyCount;
    //申请订单
    private String codeOrder;

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

    public Long getCodeType() {
        return codeType;
    }

    public void setCodeType(Long codeType) {
        this.codeType = codeType;
    }

    public Long getCodePosition() {
        return codePosition;
    }

    public void setCodePosition(Long codePosition) {
        this.codePosition = codePosition;
    }

    public Integer getApplyCount() {
        return applyCount;
    }

    public void setApplyCount(Integer applyCount) {
        this.applyCount = applyCount;
    }

    public String getCodeOrder() {
        return codeOrder;
    }

    public void setCodeOrder(String codeOrder) {
        this.codeOrder = codeOrder;
    }
}
