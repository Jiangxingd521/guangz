package com.ningyang.os.action.output.vo.web.serve;

import java.util.Date;

/**
 * @Author： kaider
 * @Date：2018/12/04 10:29
 * @描述：兑奖记录
 */
public class PrizeTicketLogVo {
    //产品名称
    private String productName;
    //奖项名称
    private String prizeSetName;
    //奖项类型
    private String prizeTypeName;
    //经销商
    private String dealerName;
    //订单号
    private String orderNo;
    //兑奖时间
    private Date ticketTime;

    private String ticketTimeStr;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPrizeSetName() {
        return prizeSetName;
    }

    public void setPrizeSetName(String prizeSetName) {
        this.prizeSetName = prizeSetName;
    }

    public String getPrizeTypeName() {
        return prizeTypeName;
    }

    public void setPrizeTypeName(String prizeTypeName) {
        this.prizeTypeName = prizeTypeName;
    }

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

    public Date getTicketTime() {
        return ticketTime;
    }

    public void setTicketTime(Date ticketTime) {
        this.ticketTime = ticketTime;
    }

    public String getTicketTimeStr() {
        return ticketTimeStr;
    }

    public void setTicketTimeStr(String ticketTimeStr) {
        this.ticketTimeStr = ticketTimeStr;
    }
}
