package com.ningyang.os.action.output.vo.web.serve;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/27 14:59
 * @描述：销售订单
 */
public class SaleOrderVo {
    //订单id
    private Long orderId;
    //销售订单
    private String orderNo;
    //经销商
    private Long dealerId;
    //经销商
    private String dealerName;
    //品牌
    private String brandName;
    //系列
    private String seriesName;
    //产品
    private Long productId;
    //产品
    private String productName;
    //数量（箱）
    private int productNumber;
    //创建人
    private String createUserName;
    //财务
    private String financialUserName;
    //订单状态
    private int orderState;
    //备注
    private String remark;
    //已出货数
    private int outBoxCount;

    private List<OrderDetailVo> detailList;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Long getDealerId() {
        return dealerId;
    }

    public void setDealerId(Long dealerId) {
        this.dealerId = dealerId;
    }

    public String getDealerName() {
        return dealerName;
    }

    public void setDealerName(String dealerName) {
        this.dealerName = dealerName;
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

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(int productNumber) {
        this.productNumber = productNumber;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }

    public String getFinancialUserName() {
        return financialUserName;
    }

    public void setFinancialUserName(String financialUserName) {
        this.financialUserName = financialUserName;
    }

    public int getOrderState() {
        return orderState;
    }

    public void setOrderState(int orderState) {
        this.orderState = orderState;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<OrderDetailVo> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<OrderDetailVo> detailList) {
        this.detailList = detailList;
    }

    public int getOutBoxCount() {
        return outBoxCount;
    }

    public void setOutBoxCount(int outBoxCount) {
        this.outBoxCount = outBoxCount;
    }
}
