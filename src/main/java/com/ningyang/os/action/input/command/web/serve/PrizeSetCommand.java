package com.ningyang.os.action.input.command.web.serve;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Author： kaider
 * @Date：2018/11/30 16:06
 * @描述：奖项设定
 */
public class PrizeSetCommand {

    private Long prizeSetId;

    private String prizeSetName;

    private Long managerId;

    private Long prodId;

    private Long memberType;

    private Long regionId;

    private int prizeQuantity;

    private BigDecimal money;

    private BigDecimal moneyEnd;

    private int ponit;

    private int pointEnd;

    private int prizeSetType;

    private int prizeModeType;

    private int cardMoney;

    private int cardCouponMoney;

    private Date[] prizeDate;

    private int setState;

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

    public Long getProdId() {
        return prodId;
    }

    public void setProdId(Long prodId) {
        this.prodId = prodId;
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

    public int getPrizeQuantity() {
        return prizeQuantity;
    }

    public void setPrizeQuantity(int prizeQuantity) {
        this.prizeQuantity = prizeQuantity;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getMoneyEnd() {
        return moneyEnd;
    }

    public void setMoneyEnd(BigDecimal moneyEnd) {
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

    public int getSetState() {
        return setState;
    }

    public void setSetState(int setState) {
        this.setState = setState;
    }
}
