package com.ningyang.os.action.output.vo.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/15 14:05
 * @描述：仓库明细
 */
public class WarehouseInventoryVo {

    private Long productId;

    private String brandName;

    private String seriesName;

    private String productName;
    //当前容量
    private int usedTotalInventory;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
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

    public int getUsedTotalInventory() {
        return usedTotalInventory;
    }

    public void setUsedTotalInventory(int usedTotalInventory) {
        this.usedTotalInventory = usedTotalInventory;
    }
}
