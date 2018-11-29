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
 * 退货订单商品明细
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
@TableName("t_ser_purchase_order_info_details")
public class SerPurchaseOrderInfoDetails extends Model<SerPurchaseOrderInfoDetails> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 退货订单id
     */
    @TableField("purchase_id")
    private Long purchaseId;
    /**
     * 产品系列id
     */
    @TableField("product_id")
    private Long productId;
    /**
     * 箱号
     */
    @TableField("box_no")
    private String boxNo;
    @TableField("is_no")
    private Integer isNo;
    @TableField("purchase_state")
    private Integer purchaseState;
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


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Long purchaseId) {
        this.purchaseId = purchaseId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getBoxNo() {
        return boxNo;
    }

    public void setBoxNo(String boxNo) {
        this.boxNo = boxNo;
    }

    public Integer getIsNo() {
        return isNo;
    }

    public void setIsNo(Integer isNo) {
        this.isNo = isNo;
    }

    public Integer getPurchaseState() {
        return purchaseState;
    }

    public void setPurchaseState(Integer purchaseState) {
        this.purchaseState = purchaseState;
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
        return this.id;
    }

    @Override
    public String toString() {
        return "SerPurchaseOrderInfoDetails{" +
        "id=" + id +
        ", purchaseId=" + purchaseId +
        ", productId=" + productId +
        ", boxNo=" + boxNo +
        ", isNo=" + isNo +
        ", purchaseState=" + purchaseState +
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
