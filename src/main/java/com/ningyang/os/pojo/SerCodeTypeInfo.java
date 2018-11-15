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
 * 溯源码类型
 * </p>
 *
 * @author kaider
 * @since 2018-11-12
 */
@TableName("t_ser_code_type_info")
public class SerCodeTypeInfo extends Model<SerCodeTypeInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 类型名称
     */
    @TableField("code_name")
    private String codeName;

    /**
     * 码类型（0：码模板，1：内外码，2：码类型）
     */
    @TableField("code_type")
    private Integer codeType;
    /**
     * 类型状态（0：使用，1：未使用）
     */
    @TableField("code_state")
    private Integer codeState;
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

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public Integer getCodeType() {
        return codeType;
    }

    public void setCodeType(Integer codeType) {
        this.codeType = codeType;
    }

    public Integer getCodeState() {
        return codeState;
    }

    public void setCodeState(Integer codeState) {
        this.codeState = codeState;
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
        return "SerCodeTypeInfo{" +
                "id=" + id +
                ", codeName=" + codeName +
                ", codeType=" + codeType +
                ", codeState=" + codeState +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                "}";
    }
}
