package com.ningyang.os.action.output.vo.web.serve;

import java.util.Date;

/**
 * @Author： kaider
 * @Date：2018/12/25 16:06
 * @描述：布奖操作记录
 */
public class PrizeSetRecordVo {
    //记录id
    private Long recordId;
    //奖项id
    private Long prizeSetId;
    //奖项名称
    private String prizeSetName;
    //布奖种类（0：订单，1：产品）
    private int prizeSetType;
    //布奖开始日期
    private Date prizeStartDate;
    //
    private String prizeStartDateStr;
    //布奖结束日期
    private Date prizeEndDate;
    //
    private String prizeEndDateStr;
    //操作日期
    private Date createTime;
    //
    private String createTimeStr;
    //当前奖项设置的状态（0：有效，1：无效）
    private Integer prizeSetState;
    //创建人
    private String userName;
    //范围（也就是实际布上奖的箱数）
    private int prizeSetCount;
    //订单id
    private Long orderId;
    //订单号
    private String orderNo;
    //经销商
    private Long dealerId;


    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public Long getPrizeSetId() {
        return prizeSetId;
    }

    public void setPrizeSetId(Long prizeSetId) {
        this.prizeSetId = prizeSetId;
    }

    public String getPrizeSetName() {
        return prizeSetName;
    }

    public void setPrizeSetName(String prizeSetName) {
        this.prizeSetName = prizeSetName;
    }

    public int getPrizeSetType() {
        return prizeSetType;
    }

    public void setPrizeSetType(int prizeSetType) {
        this.prizeSetType = prizeSetType;
    }

    public Date getPrizeStartDate() {
        return prizeStartDate;
    }

    public void setPrizeStartDate(Date prizeStartDate) {
        this.prizeStartDate = prizeStartDate;
    }

    public String getPrizeStartDateStr() {
        return prizeStartDateStr;
    }

    public void setPrizeStartDateStr(String prizeStartDateStr) {
        this.prizeStartDateStr = prizeStartDateStr;
    }

    public Date getPrizeEndDate() {
        return prizeEndDate;
    }

    public void setPrizeEndDate(Date prizeEndDate) {
        this.prizeEndDate = prizeEndDate;
    }

    public String getPrizeEndDateStr() {
        return prizeEndDateStr;
    }

    public void setPrizeEndDateStr(String prizeEndDateStr) {
        this.prizeEndDateStr = prizeEndDateStr;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public Integer getPrizeSetState() {
        return prizeSetState;
    }

    public void setPrizeSetState(Integer prizeSetState) {
        this.prizeSetState = prizeSetState;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getPrizeSetCount() {
        return prizeSetCount;
    }

    public void setPrizeSetCount(int prizeSetCount) {
        this.prizeSetCount = prizeSetCount;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Long getDealerId() {
        return dealerId;
    }

    public void setDealerId(Long dealerId) {
        this.dealerId = dealerId;
    }
}
