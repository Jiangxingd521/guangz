package com.ningyang.os.action.input.command.api;

/**
 * @Author： kaider
 * @Date：2018/11/27 10:39
 * @描述：商品入库
 */
public class ApiWarehousePutInCommand {
    //入库来源
    private int sourceType;
    //仓库
    private Long warehouse;
    //操作人
    private Long userId;
    //备注
    private String remark;
    //箱码
    private String[] boxCode;

    public int getSourceType() {
        return sourceType;
    }

    public void setSourceType(int sourceType) {
        this.sourceType = sourceType;
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
