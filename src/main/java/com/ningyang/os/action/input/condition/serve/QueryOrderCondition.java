package com.ningyang.os.action.input.condition.serve;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/11/27 14:50
 * @描述：订单
 */
public class QueryOrderCondition extends BaseCondition {
    //订单状态
    private Integer orderState;
    //订单id
    private Long orderId = -1L;
    //操作用户
    private Long userId;

    private Integer orderSaleFlag = 0;

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getOrderSaleFlag() {
        return orderSaleFlag;
    }

    public void setOrderSaleFlag(Integer orderSaleFlag) {
        this.orderSaleFlag = orderSaleFlag;
    }
}
