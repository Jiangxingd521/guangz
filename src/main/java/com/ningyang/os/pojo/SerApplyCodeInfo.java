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
 * 溯源码申请
 * </p>
 *
 * @author kaider
 * @since 2018-11-15
 */
@TableName("t_ser_apply_code_info")
public class SerApplyCodeInfo extends Model<SerApplyCodeInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 申请订单号
     */
    @TableField("code_order")
    private String codeOrder;
    /**
     * 申请人
     */
    @TableField("apply_user_id")
    private Long applyUserId;
    /**
     * 码类型
     */
    @TableField("code_type_id")
    private Long codeTypeId;
    /**
     * 码位置
     */
    @TableField("code_position_id")
    private Long codePositionId;
    /**
     *
     */
    @TableField("code_position_type_id")
    private Long codePositionTypeId;

    /**
     * 申请数量
     */
    @TableField("apply_count")
    private Integer applyCount;
    /**
     * 申请状态
     */
    @TableField("apply_state")
    private Integer applyState;
    /**
     * 溯源码存放表
     */
    @TableField("code_table_name")
    private String codeTableName;
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

    /**
     * 模板id--溯源码发放简化版使用
     */
    @TableField("code_template_id")
    private Long codeTemplateId;

    /**
     * 业务类型 正常业务0 简化版业务1
     */
    @TableField("business_type_id")
    private Long businessTypeId;

    /**
     * 申请订单-简化版。表示那两笔订单是同一个申请下的数据。
     */
    @TableField("code_order_simplified")
    private String codeOrderSimplified;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodeOrder() {
        return codeOrder;
    }

    public void setCodeOrder(String codeOrder) {
        this.codeOrder = codeOrder;
    }

    public Long getApplyUserId() {
        return applyUserId;
    }

    public void setApplyUserId(Long applyUserId) {
        this.applyUserId = applyUserId;
    }

    public Long getCodeTypeId() {
        return codeTypeId;
    }

    public void setCodeTypeId(Long codeTypeId) {
        this.codeTypeId = codeTypeId;
    }

    public Long getCodePositionId() {
        return codePositionId;
    }

    public void setCodePositionId(Long codePositionId) {
        this.codePositionId = codePositionId;
    }

    public Long getCodePositionTypeId() {
        return codePositionTypeId;
    }

    public void setCodePositionTypeId(Long codePositionTypeId) {
        this.codePositionTypeId = codePositionTypeId;
    }

    public Integer getApplyCount() {
        return applyCount;
    }

    public void setApplyCount(Integer applyCount) {
        this.applyCount = applyCount;
    }

    public Integer getApplyState() {
        return applyState;
    }

    public void setApplyState(Integer applyState) {
        this.applyState = applyState;
    }

    public String getCodeTableName() {
        return codeTableName;
    }

    public void setCodeTableName(String codeTableName) {
        this.codeTableName = codeTableName;
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

    public Long getCodeTemplateId() {
        return codeTemplateId;
    }

    public void setCodeTemplateId(Long codeTemplateId) {
        this.codeTemplateId = codeTemplateId;
    }

    public Long getBusinessTypeId() {
        return businessTypeId;
    }

    public void setBusinessTypeId(Long businessTypeId) {
        this.businessTypeId = businessTypeId;
    }

    public String getCodeOrderSimplified() {
        return codeOrderSimplified;
    }

    public void setCodeOrderSimplified(String codeOrderSimplified) {
        this.codeOrderSimplified = codeOrderSimplified;
    }

    @Override
    public String toString() {
        return "SerApplyCodeInfo{" +
                "id=" + id +
                ", codeOrder='" + codeOrder +
                ", applyUserId=" + applyUserId +
                ", codeTypeId=" + codeTypeId +
                ", codePositionId=" + codePositionId +
                ", codePositionTypeId=" + codePositionTypeId +
                ", applyCount=" + applyCount +
                ", applyState=" + applyState +
                ", codeTableName='" + codeTableName +
                ", codeTemplateId='" + codeTemplateId +
                ", businessTypeId='" + businessTypeId +
                ", codeOrderSimplified='" + codeOrderSimplified +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
