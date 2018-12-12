package com.ningyang.os.action.output.vo.api;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/12/12 16:04
 * @描述：仓库商品信息
 */
public class ApiWarehouseGoodsVo {
    //品牌
    private String brandName;
    //系列
    private String seriesName;
    //产品
    private String productName;
    //产品id
    private Long productId;
    //仓库名称
    private String warehouseName;
    //箱数
    private int boxCount;
    //具体列表
    private List<ApiWarehouseGoodsInfoVo> goodsInfoVoList;

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

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public int getBoxCount() {
        return boxCount;
    }

    public void setBoxCount(int boxCount) {
        this.boxCount = boxCount;
    }

    public List<ApiWarehouseGoodsInfoVo> getGoodsInfoVoList() {
        return goodsInfoVoList;
    }

    public void setGoodsInfoVoList(List<ApiWarehouseGoodsInfoVo> goodsInfoVoList) {
        this.goodsInfoVoList = goodsInfoVoList;
    }
}
