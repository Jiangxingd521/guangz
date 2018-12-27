package com.ningyang.os.action.output.vo.web.serve;

/**
 * @Author： kaider
 * @Date：2018/12/03 18:06
 * @描述：布奖记录
 */
public class PrizeSetLogVo {

    private Long recodeId;

    private String prizeSetName;

    private String productName;

    private String prizeTypeName;

    private String userName;

    private int prizeState;

    public Long getRecodeId() {
        return recodeId;
    }

    public void setRecodeId(Long recodeId) {
        this.recodeId = recodeId;
    }

    public String getPrizeSetName() {
        return prizeSetName;
    }

    public void setPrizeSetName(String prizeSetName) {
        this.prizeSetName = prizeSetName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPrizeTypeName() {
        return prizeTypeName;
    }

    public void setPrizeTypeName(String prizeTypeName) {
        this.prizeTypeName = prizeTypeName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getPrizeState() {
        return prizeState;
    }

    public void setPrizeState(int prizeState) {
        this.prizeState = prizeState;
    }
}
