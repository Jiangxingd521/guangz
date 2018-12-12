package com.ningyang.os.action.input.command.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/28 15:21
 * @描述：订单详情删除
 */
public class OrderDetailsDelCommand {

    private int type;

    private Long orderId;

    private Long purchaseId;

    private Long productId;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Long purchaseId) {
        this.purchaseId = purchaseId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }
}
