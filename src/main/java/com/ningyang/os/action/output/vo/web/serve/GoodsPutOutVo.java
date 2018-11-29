package com.ningyang.os.action.output.vo.web.serve;

import java.util.Date;

/**
 * @Author： kaider
 * @Date：2018/11/29 10:55
 * @描述：商品出库
 */
public class GoodsPutOutVo {
    //经销商
    private String dealerName;
    //订单号
    private String orderNo;
    //品牌
    private String brandName;
    //产品
    private String seriesName;
    //系列
    private String productName;
    //箱数
    private String boxCount;
    //操作人
    private String userName;
    //
    private Date goodsOutTime;
    //出库时间
    private String goodsOutTimeStr;

    public String getDealerName() {
        return dealerName;
    }

    public void setDealerName(String dealerName) {
        this.dealerName = dealerName;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getBoxCount() {
        return boxCount;
    }

    public void setBoxCount(String boxCount) {
        this.boxCount = boxCount;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getGoodsOutTime() {
        return goodsOutTime;
    }

    public void setGoodsOutTime(Date goodsOutTime) {
        this.goodsOutTime = goodsOutTime;
    }

    public String getGoodsOutTimeStr() {
        return goodsOutTimeStr;
    }

    public void setGoodsOutTimeStr(String goodsOutTimeStr) {
        this.goodsOutTimeStr = goodsOutTimeStr;
    }
}
