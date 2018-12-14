package com.ningyang.os.action.output.vo.web.serve;

import java.util.Date;
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
    //订单时间
    private Date orderCreateTime;

    private String orderCreateTimeStr;
    //完成时间
    private Date orderCompleteTime;

    private String orderCompleteTimeStr;
    //订单详情
    private List<OrderDetailVo> detailList;

    //出货完成后的详情
    private List<GoodsPutOutVo> warehouseDetailList;

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

    public int getOutBoxCount() {
        return outBoxCount;
    }

    public void setOutBoxCount(int outBoxCount) {
        this.outBoxCount = outBoxCount;
    }

    public Date getOrderCreateTime() {
        return orderCreateTime;
    }

    public void setOrderCreateTime(Date orderCreateTime) {
        this.orderCreateTime = orderCreateTime;
    }

    public String getOrderCreateTimeStr() {
        return orderCreateTimeStr;
    }

    public void setOrderCreateTimeStr(String orderCreateTimeStr) {
        this.orderCreateTimeStr = orderCreateTimeStr;
    }

    public Date getOrderCompleteTime() {
        return orderCompleteTime;
    }

    public void setOrderCompleteTime(Date orderCompleteTime) {
        this.orderCompleteTime = orderCompleteTime;
    }

    public String getOrderCompleteTimeStr() {
        return orderCompleteTimeStr;
    }

    public void setOrderCompleteTimeStr(String orderCompleteTimeStr) {
        this.orderCompleteTimeStr = orderCompleteTimeStr;
    }

    public List<OrderDetailVo> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<OrderDetailVo> detailList) {
        this.detailList = detailList;
    }

    public List<GoodsPutOutVo> getWarehouseDetailList() {
        return warehouseDetailList;
    }

    public void setWarehouseDetailList(List<GoodsPutOutVo> warehouseDetailList) {
        this.warehouseDetailList = warehouseDetailList;
    }
}
