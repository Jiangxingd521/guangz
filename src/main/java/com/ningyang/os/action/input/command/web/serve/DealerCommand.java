package com.ningyang.os.action.input.command.web.serve;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/14 17:59
 * @描述：经销商
 */
public class DealerCommand {
    private Long dealerId;
    //经销商
    private String dealerName;
    //联系人
    private String personName;
    //联系人电话
    private String personMobile;
    //社会码
    private String socialCode;
    //区域
    private List<Long> regionList;
    //详细地址
    private String address;
    //经销商状态（0：合作，1：不合作）
    private int dealerState;
    //备注
    private String dealerRemark;

    public Long getDealerId() {
        return dealerId;
    }

    public void setDealerId(Long dealerId) {
        this.dealerId = dealerId;
    }

    public String getDealerName() {
        return dealerName;
    }

    public void setDealerName(String dealerName) {
        this.dealerName = dealerName;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getPersonMobile() {
        return personMobile;
    }

    public void setPersonMobile(String personMobile) {
        this.personMobile = personMobile;
    }

    public String getSocialCode() {
        return socialCode;
    }

    public void setSocialCode(String socialCode) {
        this.socialCode = socialCode;
    }

    public List<Long> getRegionList() {
        return regionList;
    }

    public void setRegionList(List<Long> regionList) {
        this.regionList = regionList;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getDealerState() {
        return dealerState;
    }

    public void setDealerState(int dealerState) {
        this.dealerState = dealerState;
    }

    public String getDealerRemark() {
        return dealerRemark;
    }

    public void setDealerRemark(String dealerRemark) {
        this.dealerRemark = dealerRemark;
    }
}