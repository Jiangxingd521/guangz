package com.ningyang.os.action.output.dto.serve;

/**
 * @Author： kaider
 * @Date：2018/12/11 18:05
 * @描述：
 */
public class ApiWarehouseLOutDetailsDtoTemp {
    //产品系列名称
    private String productName;
    //扫描到的多余箱数
    private int boxCount;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getBoxCount() {
        return boxCount;
    }

    public void setBoxCount(int boxCount) {
        this.boxCount = boxCount;
    }
}
