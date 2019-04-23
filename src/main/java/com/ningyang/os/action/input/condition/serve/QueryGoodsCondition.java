package com.ningyang.os.action.input.condition.serve;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/11/21 10:11
 * @描述：商品信息
 */
public class QueryGoodsCondition extends BaseCondition {

    //码1
    private String m1;
    //码2
    private String m2;

    public String getM1() {
        return m1;
    }

    public void setM1(String m1) {
        this.m1 = m1;
    }

    public String getM2() {
        return m2;
    }

    public void setM2(String m2) {
        this.m2 = m2;
    }
}
