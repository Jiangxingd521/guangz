package com.ningyang.os.action.input.command.api;

import com.ningyang.os.pojo.SerGoodsInfo;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/28 10:03
 * @描述：商品出库
 */
public class ApiWarehousePutOutCommand {
    //备注
    private String remark;
    //商品列表
    private List<SerGoodsInfo> goodsInfoList;

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
