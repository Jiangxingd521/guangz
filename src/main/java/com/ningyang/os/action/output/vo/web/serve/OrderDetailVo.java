package com.ningyang.os.action.output.vo.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/28 15:06
 * @描述：订单详情
 */
public class OrderDetailVo {
    //明细id
    private Long detailId;
    //订单id
    private Long orderId;
    //品牌名称
    private String brandName;
    //产品名称
    private String seriesName;
    //产品系列
    private Long productId;
    private String productName;
    //销售单价
    private String salesPrice;
    //箱数
    private int boxNumber;
    //订单明细状态
    private int detailState;

    public Long getDetailId() {
        return detailId;
    }

    public void setDetailId(Long detailId) {
        this.detailId = detailId;
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

    public String getSalesPrice() {
        return salesPrice;
    }

    public void setSalesPrice(String salesPrice) {
        this.salesPrice = salesPrice;
    }

    public int getBoxNumber() {
        return boxNumber;
    }

    public void setBoxNumber(int boxNumber) {
        this.boxNumber = boxNumber;
    }

    public int getDetailState() {
        return detailState;
    }

    public void setDetailState(int detailState) {
        this.detailState = detailState;
    }
}
