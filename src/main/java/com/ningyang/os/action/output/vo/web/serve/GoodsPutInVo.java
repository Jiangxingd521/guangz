package com.ningyang.os.action.output.vo.web.serve;

import java.util.Date;

/**
 * @Author： kaider
 * @Date：2018/11/29 10:55
 * @描述：商品入库
 */
public class GoodsPutInVo {
    //仓库
    private String warehouseName;
    //品牌
    private String brandName;
    //产品
    private String seriesName;
    //系列
    private String productName;
    //箱数
    private String boxCount;
    //
    private Date createTime;
    //入库时间
    private String createTimeStr;

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
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

    public String getBoxCount() {
        return boxCount;
    }

    public void setBoxCount(String boxCount) {
        this.boxCount = boxCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }
}
