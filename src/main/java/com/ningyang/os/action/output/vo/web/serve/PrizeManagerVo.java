package com.ningyang.os.action.output.vo.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/29 18:28
 * @描述：奖项管理
 */
public class PrizeManagerVo {

    private Long managerId;

    private Long typeId;

    private String typeName;

    private String prizeName;

    private String prizeContent;

    private String prizeRemark;

    private String userName;

    private int prizeState = 0;

    public Long getManagerId() {
        return managerId;
    }

    public void setManagerId(Long managerId) {
        this.managerId = managerId;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getPrizeName() {
        return prizeName;
    }

    public void setPrizeName(String prizeName) {
        this.prizeName = prizeName;
    }

    public String getPrizeContent() {
        return prizeContent;
    }

    public void setPrizeContent(String prizeContent) {
        this.prizeContent = prizeContent;
    }

    public String getPrizeRemark() {
        return prizeRemark;
    }

    public void setPrizeRemark(String prizeRemark) {
        this.prizeRemark = prizeRemark;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getPrizeState() {
        return prizeState;
    }

    public void setPrizeState(int prizeState) {
        this.prizeState = prizeState;
    }
}
