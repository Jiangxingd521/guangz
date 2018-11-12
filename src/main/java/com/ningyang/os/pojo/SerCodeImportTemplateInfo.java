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
 * 码导入模板
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
@TableName("t_ser_code_import_template_info")
public class SerCodeImportTemplateInfo extends Model<SerCodeImportTemplateInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 品牌id
     */
    @TableField("brand_id")
    private Long brandId;
    /**
     * 系列id
     */
    @TableField("series_id")
    private Long seriesId;
    /**
     * 产品id
     */
    @TableField("product_id")
    private Long productId;
    /**
     * 左码
     */
    @TableField("left_code_type_id")
    private Long leftCodeTypeId;
    /**
     * 右码
     */
    @TableField("right_code_type_id")
    private Long rightCodeTypeId;
    /**
     * 模板说明
     */
    @TableField("template_remark")
    private String templateRemark;
    /**
     * 模板状态（0：未使用，1：使用）
     */
    @TableField("template_state")
    private Integer templateState;
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

    public Long getLeftCodeTypeId() {
        return leftCodeTypeId;
    }

    public void setLeftCodeTypeId(Long leftCodeTypeId) {
        this.leftCodeTypeId = leftCodeTypeId;
    }

    public Long getRightCodeTypeId() {
        return rightCodeTypeId;
    }

    public void setRightCodeTypeId(Long rightCodeTypeId) {
        this.rightCodeTypeId = rightCodeTypeId;
    }

    public String getTemplateRemark() {
        return templateRemark;
    }

    public void setTemplateRemark(String templateRemark) {
        this.templateRemark = templateRemark;
    }

    public Integer getTemplateState() {
        return templateState;
    }

    public void setTemplateState(Integer templateState) {
        this.templateState = templateState;
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
        return "SerCodeImportTemplateInfo{" +
        "id=" + id +
        ", brandId=" + brandId +
        ", seriesId=" + seriesId +
        ", productId=" + productId +
        ", leftCodeTypeId=" + leftCodeTypeId +
        ", rightCodeTypeId=" + rightCodeTypeId +
        ", templateRemark=" + templateRemark +
        ", templateState=" + templateState +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
