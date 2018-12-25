package com.ningyang.os.action.input.condition.serve;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/11/29 18:25
 * @描述：奖项
 */
public class QueryPrizeCondition extends BaseCondition {

    private Integer typeState;

    private Integer prizeSetType;

    private Integer prizeSetState;

    public Integer getTypeState() {
        return typeState;
    }

    public void setTypeState(Integer typeState) {
        this.typeState = typeState;
    }

    public Integer getPrizeSetType() {
        return prizeSetType;
    }

    public void setPrizeSetType(Integer prizeSetType) {
        this.prizeSetType = prizeSetType;
    }

    public Integer getPrizeSetState() {
        return prizeSetState;
    }

    public void setPrizeSetState(Integer prizeSetState) {
        this.prizeSetState = prizeSetState;
    }
}


