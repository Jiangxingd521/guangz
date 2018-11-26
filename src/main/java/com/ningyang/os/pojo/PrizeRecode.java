package com.ningyang.os.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;
/**
 * <p>
 *
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@TableName("T_PRIZE_RECODE")
public class PrizeRecode extends Model<PrizeRecode> {

    private static final long serialVersionUID = 1L;

    @TableId("prize_recor_id")
    private Long prizeRecorId;
    @TableField("order_no")
    private String orderNo;
    @TableField("pr_code")
    private String prCode;
    @TableField("prize_set_id")
    private Long prizeSetId;
    @TableField("prize_set_name")
    private Long prizeSetName;
    @TableField("prod_id")
    private Long prodId;
    @TableField("member_type")
    private Integer memberType;
    @TableField("region_id")
    private Long regionId;
    @TableField("prize_quantity")
    private Integer prizeQuantity;
    private BigDecimal money;
    private Integer ponit;
    @TableField("prize_start_date")
    private Date prizeStartDate;
    @TableField("prize_end_date")
    private Date prizeEndDate;
    @TableField("prize_set_type")
    private Integer prizeSetType;
    /**
     * 1Î»Ëæ»ú²¼ 2Î»Æ½¾ù²¼
     */
    @TableField("prize_mode_type")
    private Integer prizeModeType;
    @TableField("card_money")
    private Integer cardMoney;
    @TableField("card_coupon_money")
    private Integer cardCouponMoney;
    /**
     * 0Î´Î´¼¤»î×´Ì¬ 1Îª¼¤»î×´Ì¬
     */
    @TableField("prize_state")
    private Integer prizeState;
    @TableField("track_no")
    private String trackNo;
    @TableField("cash_time")
    private String cashTime;
    @TableField("open_id")
    private String openId;
    @TableField("user_id")
    private Long userId;
    private Integer iData1;
    private Integer iData2;
    private Integer iData3;
    private Integer iData4;
    private String sData1;
    private String sData2;
    private String sData3;
    private String sData4;
    @TableField("create_time")
    private Date createTime;
    @TableField("update_time")
    private Date updateTime;


    public Long getPrizeRecorId() {
        return prizeRecorId;
    }

    public void setPrizeRecorId(Long prizeRecorId) {
        this.prizeRecorId = prizeRecorId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getPrCode() {
        return prCode;
    }

    public void setPrCode(String prCode) {
        this.prCode = prCode;
    }

    public Long getPrizeSetId() {
        return prizeSetId;
    }

    public void setPrizeSetId(Long prizeSetId) {
        this.prizeSetId = prizeSetId;
    }

    public Long getPrizeSetName() {
        return prizeSetName;
    }

    public void setPrizeSetName(Long prizeSetName) {
        this.prizeSetName = prizeSetName;
    }

    public Long getProdId() {
        return prodId;
    }

    public void setProdId(Long prodId) {
        this.prodId = prodId;
    }

    public Integer getMemberType() {
        return memberType;
    }

    public void setMemberType(Integer memberType) {
        this.memberType = memberType;
    }

    public Long getRegionId() {
        return regionId;
    }

    public void setRegionId(Long regionId) {
        this.regionId = regionId;
    }

    public Integer getPrizeQuantity() {
        return prizeQuantity;
    }

    public void setPrizeQuantity(Integer prizeQuantity) {
        this.prizeQuantity = prizeQuantity;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getPonit() {
        return ponit;
    }

    public void setPonit(Integer ponit) {
        this.ponit = ponit;
    }

    public Date getPrizeStartDate() {
        return prizeStartDate;
    }

    public void setPrizeStartDate(Date prizeStartDate) {
        this.prizeStartDate = prizeStartDate;
    }

    public Date getPrizeEndDate() {
        return prizeEndDate;
    }

    public void setPrizeEndDate(Date prizeEndDate) {
        this.prizeEndDate = prizeEndDate;
    }

    public Integer getPrizeSetType() {
        return prizeSetType;
    }

    public void setPrizeSetType(Integer prizeSetType) {
        this.prizeSetType = prizeSetType;
    }

    public Integer getPrizeModeType() {
        return prizeModeType;
    }

    public void setPrizeModeType(Integer prizeModeType) {
        this.prizeModeType = prizeModeType;
    }

    public Integer getCardMoney() {
        return cardMoney;
    }

    public void setCardMoney(Integer cardMoney) {
        this.cardMoney = cardMoney;
    }

    public Integer getCardCouponMoney() {
        return cardCouponMoney;
    }

    public void setCardCouponMoney(Integer cardCouponMoney) {
        this.cardCouponMoney = cardCouponMoney;
    }

    public Integer getPrizeState() {
        return prizeState;
    }

    public void setPrizeState(Integer prizeState) {
        this.prizeState = prizeState;
    }

    public String getTrackNo() {
        return trackNo;
    }

    public void setTrackNo(String trackNo) {
        this.trackNo = trackNo;
    }

    public String getCashTime() {
        return cashTime;
    }

    public void setCashTime(String cashTime) {
        this.cashTime = cashTime;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getiData1() {
        return iData1;
    }

    public void setiData1(Integer iData1) {
        this.iData1 = iData1;
    }

    public Integer getiData2() {
        return iData2;
    }

    public void setiData2(Integer iData2) {
        this.iData2 = iData2;
    }

    public Integer getiData3() {
        return iData3;
    }

    public void setiData3(Integer iData3) {
        this.iData3 = iData3;
    }

    public Integer getiData4() {
        return iData4;
    }

    public void setiData4(Integer iData4) {
        this.iData4 = iData4;
    }

    public String getsData1() {
        return sData1;
    }

    public void setsData1(String sData1) {
        this.sData1 = sData1;
    }

    public String getsData2() {
        return sData2;
    }

    public void setsData2(String sData2) {
        this.sData2 = sData2;
    }

    public String getsData3() {
        return sData3;
    }

    public void setsData3(String sData3) {
        this.sData3 = sData3;
    }

    public String getsData4() {
        return sData4;
    }

    public void setsData4(String sData4) {
        this.sData4 = sData4;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.prizeRecorId;
    }

    @Override
    public String toString() {
        return "PrizeRecode{" +
        "prizeRecorId=" + prizeRecorId +
        ", orderNo=" + orderNo +
        ", prCode=" + prCode +
        ", prizeSetId=" + prizeSetId +
        ", prizeSetName=" + prizeSetName +
        ", prodId=" + prodId +
        ", memberType=" + memberType +
        ", regionId=" + regionId +
        ", prizeQuantity=" + prizeQuantity +
        ", money=" + money +
        ", ponit=" + ponit +
        ", prizeStartDate=" + prizeStartDate +
        ", prizeEndDate=" + prizeEndDate +
        ", prizeSetType=" + prizeSetType +
        ", prizeModeType=" + prizeModeType +
        ", cardMoney=" + cardMoney +
        ", cardCouponMoney=" + cardCouponMoney +
        ", prizeState=" + prizeState +
        ", trackNo=" + trackNo +
        ", cashTime=" + cashTime +
        ", openId=" + openId +
        ", userId=" + userId +
        ", iData1=" + iData1 +
        ", iData2=" + iData2 +
        ", iData3=" + iData3 +
        ", iData4=" + iData4 +
        ", sData1=" + sData1 +
        ", sData2=" + sData2 +
        ", sData3=" + sData3 +
        ", sData4=" + sData4 +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
