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
@TableName("T_MEMBER_INFO")
public class MemberInfo extends Model<MemberInfo> {

    private static final long serialVersionUID = 1L;

    @TableId("open_id")
    private String openId;
    @TableField("memer_type_id")
    private Long memerTypeId;
    @TableField("ali_pay_id")
    private String aliPayId;
    private Integer subscribe;
    @TableField("nick_name")
    private String nickName;
    private Integer sex;
    private String city;
    private String country;
    private String province;
    private String language;
    @TableField("head_img_url")
    private String headImgUrl;
    @TableField("subscribe_time")
    private Date subscribeTime;
    @TableField("union_id")
    private String unionId;
    private String remark;
    @TableField("group_id")
    private String groupId;
    @TableField("tagid_list")
    private String tagidList;
    @TableField("wechat_app_id")
    private String wechatAppId;
    @TableField("member_name")
    private String memberName;
    @TableField("member_mobile")
    private String memberMobile;
    @TableField("member_account")
    private String memberAccount;
    @TableField("member_password")
    private String memberPassword;
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


    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public Long getMemerTypeId() {
        return memerTypeId;
    }

    public void setMemerTypeId(Long memerTypeId) {
        this.memerTypeId = memerTypeId;
    }

    public String getAliPayId() {
        return aliPayId;
    }

    public void setAliPayId(String aliPayId) {
        this.aliPayId = aliPayId;
    }

    public Integer getSubscribe() {
        return subscribe;
    }

    public void setSubscribe(Integer subscribe) {
        this.subscribe = subscribe;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getHeadImgUrl() {
        return headImgUrl;
    }

    public void setHeadImgUrl(String headImgUrl) {
        this.headImgUrl = headImgUrl;
    }

    public Date getSubscribeTime() {
        return subscribeTime;
    }

    public void setSubscribeTime(Date subscribeTime) {
        this.subscribeTime = subscribeTime;
    }

    public String getUnionId() {
        return unionId;
    }

    public void setUnionId(String unionId) {
        this.unionId = unionId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getTagidList() {
        return tagidList;
    }

    public void setTagidList(String tagidList) {
        this.tagidList = tagidList;
    }

    public String getWechatAppId() {
        return wechatAppId;
    }

    public void setWechatAppId(String wechatAppId) {
        this.wechatAppId = wechatAppId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberMobile() {
        return memberMobile;
    }

    public void setMemberMobile(String memberMobile) {
        this.memberMobile = memberMobile;
    }

    public String getMemberAccount() {
        return memberAccount;
    }

    public void setMemberAccount(String memberAccount) {
        this.memberAccount = memberAccount;
    }

    public String getMemberPassword() {
        return memberPassword;
    }

    public void setMemberPassword(String memberPassword) {
        this.memberPassword = memberPassword;
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
        return this.openId;
    }

    @Override
    public String toString() {
        return "MemberInfo{" +
        "openId=" + openId +
        ", memerTypeId=" + memerTypeId +
        ", aliPayId=" + aliPayId +
        ", subscribe=" + subscribe +
        ", nickName=" + nickName +
        ", sex=" + sex +
        ", city=" + city +
        ", country=" + country +
        ", province=" + province +
        ", language=" + language +
        ", headImgUrl=" + headImgUrl +
        ", subscribeTime=" + subscribeTime +
        ", unionId=" + unionId +
        ", remark=" + remark +
        ", groupId=" + groupId +
        ", tagidList=" + tagidList +
        ", wechatAppId=" + wechatAppId +
        ", memberName=" + memberName +
        ", memberMobile=" + memberMobile +
        ", memberAccount=" + memberAccount +
        ", memberPassword=" + memberPassword +
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
