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
    //订单id
    private Long orderId;
    //品牌
    private String brandName;
    //产品
    private String seriesName;
    //系列
    private String productName;
    //订单箱数
    private int orderBoxCount;
    //已出箱数
    private int outBoxCount;
    //操作人
    private String userName;
    //
    private Date goodsOutTime;
    //出库时间
    private String goodsOutTimeStr;
    //完成状态（0：未完成，1：已完成）
    private int finishFlag;
    //产品系列id
    private Long productId;
    //商品id
    private Long goodsId;
    //唯一码
    private String prCode;

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

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
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

    public int getOrderBoxCount() {
        return orderBoxCount;
    }

    public void setOrderBoxCount(int orderBoxCount) {
        this.orderBoxCount = orderBoxCount;
    }

    public int getOutBoxCount() {
        return outBoxCount;
    }

    public void setOutBoxCount(int outBoxCount) {
        this.outBoxCount = outBoxCount;
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

    public int getFinishFlag() {
        return finishFlag;
    }

    public void setFinishFlag(int finishFlag) {
        this.finishFlag = finishFlag;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public String getPrCode() {
        return prCode;
    }

    public void setPrCode(String prCode) {
        this.prCode = prCode;
    }
}
