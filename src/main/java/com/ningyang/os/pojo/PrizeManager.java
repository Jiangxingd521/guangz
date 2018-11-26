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
 * 奖项管理
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@TableName("T_PRIZE_MANAGER")
public class PrizeManager extends Model<PrizeManager> {

    private static final long serialVersionUID = 1L;

    @TableId("prize_manage_id")
    private Long prizeManageId;
    /**
     * 奖项类型
     */
    @TableField("prize_type_id")
    private Long prizeTypeId;
    /**
     * 奖项名称
     */
    @TableField("prize_name")
    private String prizeName;
    /**
     * 奖项内容
     */
    @TableField("prize_content")
    private String prizeContent;
    /**
     * 奖项备注
     */
    @TableField("prize_remark")
    private String prizeRemark;
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


    public Long getPrizeManageId() {
        return prizeManageId;
    }

    public void setPrizeManageId(Long prizeManageId) {
        this.prizeManageId = prizeManageId;
    }

    public Long getPrizeTypeId() {
        return prizeTypeId;
    }

    public void setPrizeTypeId(Long prizeTypeId) {
        this.prizeTypeId = prizeTypeId;
    }

    public String getPrizeName() {
        return prizeName;
    }

    public void setPrizeName(String prizeName) {
        this.prizeName = prizeName;
    }

    public String getPrizeContent() {
        return prizeContent;
    }

    public void setPrizeContent(String prizeContent) {
        this.prizeContent = prizeContent;
    }

    public String getPrizeRemark() {
        return prizeRemark;
    }

    public void setPrizeRemark(String prizeRemark) {
        this.prizeRemark = prizeRemark;
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
        return this.prizeManageId;
    }

    @Override
    public String toString() {
        return "PrizeManager{" +
        "prizeManageId=" + prizeManageId +
        ", prizeTypeId=" + prizeTypeId +
        ", prizeName=" + prizeName +
        ", prizeContent=" + prizeContent +
        ", prizeRemark=" + prizeRemark +
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
