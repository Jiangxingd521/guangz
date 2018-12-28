package com.ningyang.os.action.output.vo.web.serve;

import java.util.Date;
import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/12/10 14:52
 * @描述：退单
 */
public class OrderPurchaseVo {
    //退货订单id
    private Long purchaseId;
    //退货订单号
    private String orderNo;
    //经销商
    private Long dealerId;
    //经销商
    private String dealerName;
    //数量（箱）
    private int productNumber;
    //联系人
    private String personName;
    //联系人电话
    private String personMobile;
    //退货备注
    private String remark;
    //接收到的箱数
    private int receiveBoxNumber;
    //创建人
    private String createUserName;
    //财务
    private String financialUserName;
    //订单状态
    private int orderState;
    //订单时间
    private Date orderCreateTime;

    private String orderCreateTimeStr;
    //完成时间
    private Date orderCompleteTime;

    private String orderCompleteTimeStr;
    //订单详情
    private List<OrderDetailVo> detailList;
    //收货完成后的详情
    private List<GoodsPutInVo> warehouseDetailList;

    public Long getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Long purchaseId) {
        this.purchaseId = purchaseId;
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

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getPersonMobile() {
        return personMobile;
    }

    public void setPersonMobile(String personMobile) {
        this.personMobile = personMobile;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getReceiveBoxNumber() {
        return receiveBoxNumber;
    }

    public void setReceiveBoxNumber(int receiveBoxNumber) {
        this.receiveBoxNumber = receiveBoxNumber;
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

    public List<GoodsPutInVo> getWarehouseDetailList() {
        return warehouseDetailList;
    }

    public void setWarehouseDetailList(List<GoodsPutInVo> warehouseDetailList) {
        this.warehouseDetailList = warehouseDetailList;
    }
}
