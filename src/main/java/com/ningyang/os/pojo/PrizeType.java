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
 *
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@TableName("T_PRIZE_TYPE")
public class PrizeType extends Model<PrizeType> {

    private static final long serialVersionUID = 1L;

    @TableId("prize_type_id")
    private Long prizeTypeId;
    @TableField("prize_type_code")
    private String prizeTypeCode;
    @TableField("prize_type_name")
    private String prizeTypeName;
    @TableField("prize_type_content")
    private String prizeTypeContent;
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


    public Long getPrizeTypeId() {
        return prizeTypeId;
    }

    public void setPrizeTypeId(Long prizeTypeId) {
        this.prizeTypeId = prizeTypeId;
    }

    public String getPrizeTypeCode() {
        return prizeTypeCode;
    }

    public void setPrizeTypeCode(String prizeTypeCode) {
        this.prizeTypeCode = prizeTypeCode;
    }

    public String getPrizeTypeName() {
        return prizeTypeName;
    }

    public void setPrizeTypeName(String prizeTypeName) {
        this.prizeTypeName = prizeTypeName;
    }

    public String getPrizeTypeContent() {
        return prizeTypeContent;
    }

    public void setPrizeTypeContent(String prizeTypeContent) {
        this.prizeTypeContent = prizeTypeContent;
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
        return this.prizeTypeId;
    }

    @Override
    public String toString() {
        return "PrizeType{" +
        "prizeTypeId=" + prizeTypeId +
        ", prizeTypeCode=" + prizeTypeCode +
        ", prizeTypeName=" + prizeTypeName +
        ", prizeTypeContent=" + prizeTypeContent +
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
