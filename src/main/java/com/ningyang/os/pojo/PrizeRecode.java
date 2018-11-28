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
     *
     */
    @TableField("prize_mode_type")
    private Integer prizeModeType;
    @TableField("card_money")
    private Integer cardMoney;
    @TableField("card_coupon_money")
    private Integer cardCouponMoney;
    /**
     *
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
    private Integer idata1;
    private Integer idata2;
    private Integer idata3;
    private Integer idata4;
    private String sdata1;
    private String sdata2;
    private String sdata3;
    private String sdata4;
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

    public Integer getIdata1() {
        return idata1;
    }

    public void setIdata1(Integer idata1) {
        this.idata1 = idata1;
    }

    public Integer getIdata2() {
        return idata2;
    }

    public void setIdata2(Integer idata2) {
        this.idata2 = idata2;
    }

    public Integer getIdata3() {
        return idata3;
    }

    public void setIdata3(Integer idata3) {
        this.idata3 = idata3;
    }

    public Integer getIdata4() {
        return idata4;
    }

    public void setIdata4(Integer idata4) {
        this.idata4 = idata4;
    }

    public String getSdata1() {
        return sdata1;
    }

    public void setSdata1(String sdata1) {
        this.sdata1 = sdata1;
    }

    public String getSdata2() {
        return sdata2;
    }

    public void setSdata2(String sdata2) {
        this.sdata2 = sdata2;
    }

    public String getSdata3() {
        return sdata3;
    }

    public void setSdata3(String sdata3) {
        this.sdata3 = sdata3;
    }

    public String getSdata4() {
        return sdata4;
    }

    public void setSdata4(String sdata4) {
        this.sdata4 = sdata4;
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


}
