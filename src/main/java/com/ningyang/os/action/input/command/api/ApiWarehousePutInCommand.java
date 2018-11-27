package com.ningyang.os.action.input.command.api;

import com.ningyang.os.pojo.SerGoodsInfo;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/27 10:39
 * @描述：商品入库
 */
public class ApiWarehousePutInCommand {
    //入库来源
    private int sourceType;
    //仓库
    private Long warehouseId;
    //操作人
    private Long userId;
    //备注
    private String remark;
    //商品列表
    private List<SerGoodsInfo> goodsInfoList;

    public int getSourceType() {
        return sourceType;
    }

    public void setSourceType(int sourceType) {
        this.sourceType = sourceType;
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

    public List<SerGoodsInfo> getGoodsInfoList() {
        return goodsInfoList;
    }

    public void setGoodsInfoList(List<SerGoodsInfo> goodsInfoList) {
        this.goodsInfoList = goodsInfoList;
    }
}