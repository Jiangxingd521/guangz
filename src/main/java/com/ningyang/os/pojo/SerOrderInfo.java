package com.ningyang.os.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import java.io.Serializable;
/**
 * <p>
 * 销售订单表
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@TableName("t_ser_order_info")
public class SerOrderInfo extends Model<SerOrderInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 订单号
     */
    @TableField("order_no")
    private String orderNo;
    /**
     * 经销商
     */
    @TableField("dealer_id")
    private Long dealerId;
    /**
     * 经销商社会编码
     */
    @TableField("dealer_code")
    private String dealerCode;
    /**
     * 品牌
     */
    @TableField("brand_id")
    private Long brandId;
    /**
     * 产品
     */
    @TableField("series_id")
    private Long seriesId;
    /**
     * 系列
     */
    @TableField("product_id")
    private Long productId;
    /**
     * 数量
     */
    @TableField("product_number")
    private String productNumber;
    /**
     * 订单状态（0：备单，1：确认订单，2：发货）
     */
    @TableField("order_state")
    private Integer orderState;
    /**
     * 备注
     */
    @TableField("order_remark")
    private String orderRemark;
    /**
     * 操作人
     */
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


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getDealerCode() {
        return dealerCode;
    }

    public void setDealerCode(String dealerCode) {
        this.dealerCode = dealerCode;
    }

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Long getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(Long seriesId) {
        this.seriesId = seriesId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(String productNumber) {
        this.productNumber = productNumber;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public String getOrderRemark() {
        return orderRemark;
    }

    public void setOrderRemark(String orderRemark) {
        this.orderRemark = orderRemark;
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
        return this.id;
    }

    @Override
    public String toString() {
        return "SerOrderInfo{" +
        "id=" + id +
        ", orderNo=" + orderNo +
        ", dealerId=" + dealerId +
        ", dealerCode=" + dealerCode +
        ", brandId=" + brandId +
        ", seriesId=" + seriesId +
        ", productId=" + productId +
        ", productNumber=" + productNumber +
        ", orderState=" + orderState +
        ", orderRemark=" + orderRemark +
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
