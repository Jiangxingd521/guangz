package com.ningyang.os.action.input.command.web.serve;

import com.ningyang.os.action.output.vo.web.serve.OrderDetailVo;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/27 15:39
 * @描述：销售订单
 */
public class OrderSaleCommand {
    //订单id
    private Long orderId;
    //操作类型（0：创建，1：财务）
    private int operateType;
    //经销商id
    private Long dealerId;
    //产品id
    private Long productId;
    //产品数量
    private String productNumber;
    //订单状态
    private int orderState;
    //备注
    private String remark;
    //创建人
    private Long createUserId;
    //财务
    private Long financialId;
    //明细
    private List<OrderDetailVo> detailList;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public int getOperateType() {
        return operateType;
    }

    public void setOperateType(int operateType) {
        this.operateType = operateType;
    }

    public Long getDealerId() {
        return dealerId;
    }

    public void setDealerId(Long dealerId) {
        this.dealerId = dealerId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(String productNumber) {
        this.productNumber = productNumber;
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

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public Long getFinancialId() {
        return financialId;
    }

    public void setFinancialId(Long financialId) {
        this.financialId = financialId;
    }

    public List<OrderDetailVo> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<OrderDetailVo> detailList) {
        this.detailList = detailList;
    }
}
