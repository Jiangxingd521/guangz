package com.ningyang.os.action.input.command.web.serve;

/**
 * @Author： kaider
 * @Date：2018/12/03 11:54
 * @描述：商品布奖设置记录
 */
public class PrizeSetLogCommand {
    //布奖设置id
    private Long prizeSetId;
    //布奖种类（1：订单，2：产品系列）
    private int prizeSpecies;
    //订单号
    private String orderNo;
    //产品系列id
    private Long prodId;
    //激活状态（0：未激活，1激活）
    private Integer setLogState;

    public Long getPrizeSetId() {
        return prizeSetId;
    }

    public void setPrizeSetId(Long prizeSetId) {
        this.prizeSetId = prizeSetId;
    }

    public int getPrizeSpecies() {
        return prizeSpecies;
    }

    public void setPrizeSpecies(int prizeSpecies) {
        this.prizeSpecies = prizeSpecies;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Long getProdId() {
        return prodId;
    }

    public void setProdId(Long prodId) {
        this.prodId = prodId;
    }

    public Integer getSetLogState() {
        return setLogState;
    }

    public void setSetLogState(Integer setLogState) {
        this.setLogState = setLogState;
    }
}
