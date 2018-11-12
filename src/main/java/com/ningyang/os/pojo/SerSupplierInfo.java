package com.ningyang.os.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 供应商信息
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
@TableName("t_ser_supplier_info")
public class SerSupplierInfo extends Model<SerSupplierInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 供应商名称
     */
    @TableField("supplier_name")
    private String supplierName;
    /**
     * 供应商电话
     */
    @TableField("supplier_mobile")
    private String supplierMobile;
    /**
     * 与供应商合作状态（0：合作，1：不合作）
     */
    @TableField("supplier_state")
    private Integer supplierState;
    /**
     * 供应商区域id
     */
    @TableField("supplier_region_id")
    private String supplierRegionId;
    /**
     * 供应商详细地址
     */
    @TableField("supplier_address")
    private String supplierAddress;
    /**
     * 供应商社会码
     */
    @TableField("supplier_social_code")
    private String supplierSocialCode;
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


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getSupplierMobile() {
        return supplierMobile;
    }

    public void setSupplierMobile(String supplierMobile) {
        this.supplierMobile = supplierMobile;
    }

    public Integer getSupplierState() {
        return supplierState;
    }

    public void setSupplierState(Integer supplierState) {
        this.supplierState = supplierState;
    }

    public String getSupplierRegionId() {
        return supplierRegionId;
    }

    public void setSupplierRegionId(String supplierRegionId) {
        this.supplierRegionId = supplierRegionId;
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }

    public String getSupplierSocialCode() {
        return supplierSocialCode;
    }

    public void setSupplierSocialCode(String supplierSocialCode) {
        this.supplierSocialCode = supplierSocialCode;
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
        return "SerSupplierInfo{" +
        "id=" + id +
        ", supplierName=" + supplierName +
        ", supplierMobile=" + supplierMobile +
        ", supplierState=" + supplierState +
        ", supplierRegionId=" + supplierRegionId +
        ", supplierAddress=" + supplierAddress +
        ", supplierSocialCode=" + supplierSocialCode +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
