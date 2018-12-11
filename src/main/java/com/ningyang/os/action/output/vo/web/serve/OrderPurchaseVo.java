package com.ningyang.os.action.output.vo.web.serve;

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
    //联系人
    private String personName;
    //联系人电话
    private String personMobile;
    //退货备注
    private String remark;
    //订单详情
    private List<OrderDetailVo> detailList;
    //数量（箱）
    private int productNumber;
    //接收到的箱数
    private int receiveBoxNumber;
    //创建人
    private String createUserName;
    //财务
    private String financialUserName;
    //订单状态
    private int orderState;

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

    public List<OrderDetailVo> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<OrderDetailVo> detailList) {
        this.detailList = detailList;
    }

    public int getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(int productNumber) {
        this.productNumber = productNumber;
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
}
