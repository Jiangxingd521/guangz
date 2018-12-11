package com.ningyang.os.action.output.dto.serve;

/**
 * @Author： kaider
 * @Date：2018/12/11 17:07
 * @描述：
 */
public class ApiWarehouseOutDetailsDtoTemp {
    //产品系列id
    private Long productId;
    //箱数
    private int boxNumber;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public int getBoxNumber() {
        return boxNumber;
    }

    public void setBoxNumber(int boxNumber) {
        this.boxNumber = boxNumber;
    }
}
