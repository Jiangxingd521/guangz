package com.ningyang.os.action.input.condition.serve;

import com.ningyang.os.action.input.condition.common.BaseCondition;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/14 16:53
 * @描述：经销商
 */
public class QueryDealerCondition extends BaseCondition {
    //经销商
    private String dealerName;
    //联系人
    private String personName;
    //联系人电话
    private String personMobile;

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

}
