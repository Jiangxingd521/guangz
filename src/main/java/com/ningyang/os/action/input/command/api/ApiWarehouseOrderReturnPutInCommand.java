package com.ningyang.os.action.input.command.api;

/**
 * @Author： kaider
 * @Date：2018/11/27 10:39
 * @描述：商品退货入库
 */
public class ApiWarehouseOrderReturnPutInCommand {
    //退货订单id
    private Long purchaseId;
    //仓库
    private Long warehouseId;
    //操作人
    private Long userId;
    //备注
    private String remark;
    //箱码
    private String[] boxCode;

    public Long getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Long purchaseId) {
        this.purchaseId = purchaseId;
    }

    public Long getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String[] getBoxCode() {
        return boxCode;
    }

    public void setBoxCode(String[] boxCode) {
        this.boxCode = boxCode;
    }
}
