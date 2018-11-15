package com.ningyang.os.action.output.vo.web.serve;

import java.util.Date;

/**
 * @Author： kaider
 * @Date：2018/11/15 16:18
 * @描述：溯源码申请
 */
public class ApplyCodeVo {

    private Long applyId;

    private Long codeType;
    //码类型
    private String codeTypeName;

    private Long codePosition;
    //码位置
    private String codePositionName;
    //申请人
    private String applyUserName;
    //数量
    private int applyCount;
    //申请状态
    private int applyState;
    //申请时间
    private Date createTime;

    public Long getApplyId() {
        return applyId;
    }

    public void setApplyId(Long applyId) {
        this.applyId = applyId;
    }

    public Long getCodePosition() {
        return codePosition;
    }

    public void setCodePosition(Long codePosition) {
        this.codePosition = codePosition;
    }

    public String getCodePositionName() {
        return codePositionName;
    }

    public void setCodePositionName(String codePositionName) {
        this.codePositionName = codePositionName;
    }

    public Long getCodeType() {
        return codeType;
    }

    public void setCodeType(Long codeType) {
        this.codeType = codeType;
    }

    public String getCodeTypeName() {
        return codeTypeName;
    }

    public void setCodeTypeName(String codeTypeName) {
        this.codeTypeName = codeTypeName;
    }

    public String getApplyUserName() {
        return applyUserName;
    }

    public void setApplyUserName(String applyUserName) {
        this.applyUserName = applyUserName;
    }

    public int getApplyCount() {
        return applyCount;
    }

    public void setApplyCount(int applyCount) {
        this.applyCount = applyCount;
    }

    public int getApplyState() {
        return applyState;
    }

    public void setApplyState(int applyState) {
        this.applyState = applyState;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
