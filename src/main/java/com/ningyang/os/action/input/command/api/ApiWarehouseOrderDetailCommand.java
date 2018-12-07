package com.ningyang.os.action.input.command.api;

/**
 * @Author： kaider
 * @Date：2018/12/06 15:38
 * @描述：
 */
public class ApiWarehouseOrderDetailCommand {

    private Long orderId;

    private Long productId;

    private int boxNumber;

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

    public int getBoxNumber() {
        return boxNumber;
    }

    public void setBoxNumber(int boxNumber) {
        this.boxNumber = boxNumber;
    }
}
