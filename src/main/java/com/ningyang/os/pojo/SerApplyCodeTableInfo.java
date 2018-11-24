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
 * 溯源码申请对应的存放表
 * </p>
 *
 * @author kaider
 * @since 2018-11-25
 */
@TableName("t_ser_apply_code_table_info")
public class SerApplyCodeTableInfo extends Model<SerApplyCodeTableInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 溯源码申请订单号
     */
    @TableField("code_order")
    private String codeOrder;
    /**
     * 溯源码存在的表
     */
    @TableField("code_table_name")
    private String codeTableName;
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

    public String getCodeOrder() {
        return codeOrder;
    }

    public void setCodeOrder(String codeOrder) {
        this.codeOrder = codeOrder;
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

    @Override
    public String toString() {
        return "SerApplyCodeTableInfo{" +
        "id=" + id +
        ", codeOrder=" + codeOrder +
        ", codeTableName=" + codeTableName +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
