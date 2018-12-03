package com.ningyang.os.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 布奖记录
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
@TableName("t_ser_prize_recode_info")
public class SerPrizeRecodeInfo extends Model<SerPrizeRecodeInfo> {

    private static final long serialVersionUID = 1L;

    @TableId("prize_recor_id")
    private Long prizeRecorId;
    /**
     * 订单编号
     */
    @TableField("order_no")
    private String orderNo;
    /**
     * 产品编码
     */
    @TableField("pr_code")
    private String prCode;
    /**
     * 奖项设定id
     */
    @TableField("prize_set_id")
    private Long prizeSetId;
    /**
     * 布奖名称
     */
    @TableField("prize_set_name")
    private String prizeSetName;
    /**
     * 产品id
     */
    @TableField("prod_id")
    private Long prodId;
    /**
     * 会员类型
     */
    @TableField("member_type")
    private Long memberType;
    /**
     * 布奖区域
     */
    @TableField("region_id")
    private Long regionId;
    /**
     * 布奖数量
     */
    @TableField("prize_quantity")
    private Integer prizeQuantity;
    /**
     * 红包额度
     */
    private BigDecimal money;
    /**
     * 积分额度
     */
    private Integer ponit;
    /**
     * 布奖类型（1：限制，2：不限制）
     */
    @TableField("prize_set_type")
    private Integer prizeSetType;
    /**
     * 布奖模式（1：随机部署，2：平均部署）
     */
    @TableField("prize_mode_type")
    private Integer prizeModeType;
    /**
     * 卡券消费额度
     */
    @TableField("card_money")
    private Integer cardMoney;
    /**
     * 卡券优惠额度
     */
    @TableField("card_coupon_money")
    private Integer cardCouponMoney;
    /**
     * 布奖状态（0：未激活，1：已激活）
     */
    @TableField("prize_state")
    private Integer prizeState;
    /**
     * 快递单号
     */
    @TableField("track_no")
    private String trackNo;
    /**
     * 兑奖时间
     */
    @TableField("cash_time")
    private String cashTime;
    /**
     * 中奖人id
     */
    @TableField("open_id")
    private String openId;
    /**
     * 布奖开始日期
     */
    @TableField("prize_start_date")
    private Date prizeStartDate;
    /**
     * 布奖结束日期
     */
    @TableField("prize_end_date")
    private Date prizeEndDate;
    /**
     * 创建人
     */
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
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
    /**
     * 修改时间
     */
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

    public String getPrizeSetName() {
        return prizeSetName;
    }

    public void setPrizeSetName(String prizeSetName) {
        this.prizeSetName = prizeSetName;
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

    @Override
    public String toString() {
        return "SerPrizeRecodeInfo{" +
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
                ", prizeSetType=" + prizeSetType +
                ", prizeModeType=" + prizeModeType +
                ", cardMoney=" + cardMoney +
                ", cardCouponMoney=" + cardCouponMoney +
                ", prizeState=" + prizeState +
                ", trackNo=" + trackNo +
                ", cashTime=" + cashTime +
                ", openId=" + openId +
                ", prizeStartDate=" + prizeStartDate +
                ", prizeEndDate=" + prizeEndDate +
                ", userId=" + userId +
                ", idata1=" + idata1 +
                ", idata2=" + idata2 +
                ", idata3=" + idata3 +
                ", idata4=" + idata4 +
                ", sdata1=" + sdata1 +
                ", sdata2=" + sdata2 +
                ", sdata3=" + sdata3 +
                ", sdata4=" + sdata4 +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                "}";
    }
}
