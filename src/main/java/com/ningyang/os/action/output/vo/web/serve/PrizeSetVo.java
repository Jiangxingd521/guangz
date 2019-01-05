package com.ningyang.os.action.output.vo.web.serve;

import java.util.Date;
import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/30 16:07
 * @描述：
 */
public class PrizeSetVo {

    private Long prizeSetId;

    private String prizeSetName;

    private Long managerId;

    private String managerName;

    private Long prodId;

    private String productName;

    private Long memberType;

    private Long regionId;

    private List<String> regionList;

    private int prizeQuantity;

    private String money;

    private String moneyEnd;

    private int ponit;

    private int pointEnd;

    private int prizeSetType;

    private int prizeModeType;

    private int cardMoney;

    private int cardCouponMoney;

    private Date[] prizeDate;

    private Date prizeStartDate;

    private String prizeStartDateStr;

    private Date prizeEndDate;

    private String prizeEndDateStr;

    private int setState;

    private String userName;

    private PrizeManagerVo prizeManager;

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

    public Long getManagerId() {
        return managerId;
    }

    public void setManagerId(Long managerId) {
        this.managerId = managerId;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public Long getProdId() {
        return prodId;
    }

    public void setProdId(Long prodId) {
        this.prodId = prodId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Long getMemberType() {
        return memberType;
    }

    public void setMemberType(Long memberType) {
        this.memberType = memberType;
    }

    public Long getRegionId() {
        return regionId;
    }

    public void setRegionId(Long regionId) {
        this.regionId = regionId;
    }

    public List<String> getRegionList() {
        return regionList;
    }

    public void setRegionList(List<String> regionList) {
        this.regionList = regionList;
    }

    public int getPrizeQuantity() {
        return prizeQuantity;
    }

    public void setPrizeQuantity(int prizeQuantity) {
        this.prizeQuantity = prizeQuantity;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getMoneyEnd() {
        return moneyEnd;
    }

    public void setMoneyEnd(String moneyEnd) {
        this.moneyEnd = moneyEnd;
    }

    public int getPonit() {
        return ponit;
    }

    public void setPonit(int ponit) {
        this.ponit = ponit;
    }

    public int getPointEnd() {
        return pointEnd;
    }

    public void setPointEnd(int pointEnd) {
        this.pointEnd = pointEnd;
    }

    public int getPrizeSetType() {
        return prizeSetType;
    }

    public void setPrizeSetType(int prizeSetType) {
        this.prizeSetType = prizeSetType;
    }

    public int getPrizeModeType() {
        return prizeModeType;
    }

    public void setPrizeModeType(int prizeModeType) {
        this.prizeModeType = prizeModeType;
    }

    public int getCardMoney() {
        return cardMoney;
    }

    public void setCardMoney(int cardMoney) {
        this.cardMoney = cardMoney;
    }

    public int getCardCouponMoney() {
        return cardCouponMoney;
    }

    public void setCardCouponMoney(int cardCouponMoney) {
        this.cardCouponMoney = cardCouponMoney;
    }

    public Date[] getPrizeDate() {
        return prizeDate;
    }

    public void setPrizeDate(Date[] prizeDate) {
        this.prizeDate = prizeDate;
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

    public int getSetState() {
        return setState;
    }

    public void setSetState(int setState) {
        this.setState = setState;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public PrizeManagerVo getPrizeManager() {
        return prizeManager;
    }

    public void setPrizeManager(PrizeManagerVo prizeManager) {
        this.prizeManager = prizeManager;
    }
}
