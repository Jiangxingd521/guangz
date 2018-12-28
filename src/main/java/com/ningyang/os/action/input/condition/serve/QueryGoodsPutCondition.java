package com.ningyang.os.action.input.condition.serve;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/11/29 10:53
 * @描述：商品出入库
 */
public class QueryGoodsPutCondition extends BaseCondition {
    //订单号
    private String orderNo;
    //订单id
    private Long orderId;
    //产品系列id
    private Long productId;
    //退货订单id
    private Long purchaseId;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Long purchaseId) {
        this.purchaseId = purchaseId;
    }
}
