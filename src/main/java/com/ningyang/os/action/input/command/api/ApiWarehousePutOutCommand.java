package com.ningyang.os.action.input.command.api;

/**
 * @Author： kaider
 * @Date：2018/11/28 10:03
 * @描述：商品出库
 */
public class ApiWarehousePutOutCommand {
    //销售订单id
    private Long orderId;
    //仓库
    private Long warehouse;
    //操作人
    private Long userId;
    //箱码
    private String[] boxCode;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(Long warehouse) {
        this.warehouse = warehouse;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String[] getBoxCode() {
        return boxCode;
    }

    public void setBoxCode(String[] boxCode) {
        this.boxCode = boxCode;
    }
}
