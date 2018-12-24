package com.ningyang.os.action.output.dto.serve;

/**
 * @Author： kaider
 * @Date：2018/12/24 10:27
 * @描述：商品组成码
 */
public class ProductCodeDto {

    private Long productId;

    private Long codeId;

    private String codeName;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getCodeId() {
        return codeId;
    }

    public void setCodeId(Long codeId) {
        this.codeId = codeId;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }
}
