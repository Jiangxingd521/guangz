package com.ningyang.os.action.output.vo.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/15 14:05
 * @描述：仓库
 */
public class WarehouseVo {

    private Long warehouseId;

    private String warehouseName;

    private Long warehouseUserId;

    private String warehousePerson;

    private String warehousePersonMobile;

    private String totalInventory;

    private String warehouseRemark;

    private int warehouseState;

    public Long getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public Long getWarehouseUserId() {
        return warehouseUserId;
    }

    public void setWarehouseUserId(Long warehouseUserId) {
        this.warehouseUserId = warehouseUserId;
    }

    public String getWarehousePerson() {
        return warehousePerson;
    }

    public void setWarehousePerson(String warehousePerson) {
        this.warehousePerson = warehousePerson;
    }

    public String getWarehousePersonMobile() {
        return warehousePersonMobile;
    }

    public void setWarehousePersonMobile(String warehousePersonMobile) {
        this.warehousePersonMobile = warehousePersonMobile;
    }

    public String getTotalInventory() {
        return totalInventory;
    }

    public void setTotalInventory(String totalInventory) {
        this.totalInventory = totalInventory;
    }

    public String getWarehouseRemark() {
        return warehouseRemark;
    }

    public void setWarehouseRemark(String warehouseRemark) {
        this.warehouseRemark = warehouseRemark;
    }

    public int getWarehouseState() {
        return warehouseState;
    }

    public void setWarehouseState(int warehouseState) {
        this.warehouseState = warehouseState;
    }
}
