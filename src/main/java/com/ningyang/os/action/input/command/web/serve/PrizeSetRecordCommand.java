package com.ningyang.os.action.input.command.web.serve;

import com.ningyang.os.action.output.vo.web.serve.SaleOrderVo;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/30 16:06
 * @描述：布奖操作
 */
public class PrizeSetRecordCommand {
    //布奖操作id
    private Long recordId;
    //订单信息
    private List<SaleOrderVo> saleOrderVoList;
    //品牌id
    private Long brandId;
    //系列id
    private Long seriesId;
    //产品id
    private Long productId;
    //奖项id
    private Long prizeSetId;
    //奖项类型（0：订单，1：产品）
    private int prizeSetType;
    //当前奖项设置的状态（0：有效，1：无效）
    private int prizeSetState;

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public List<SaleOrderVo> getSaleOrderVoList() {
        return saleOrderVoList;
    }

    public void setSaleOrderVoList(List<SaleOrderVo> saleOrderVoList) {
        this.saleOrderVoList = saleOrderVoList;
    }

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Long getSeriesId() {
        return seriesId;
    }

    public void setSeriesId(Long seriesId) {
        this.seriesId = seriesId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getPrizeSetId() {
        return prizeSetId;
    }

    public void setPrizeSetId(Long prizeSetId) {
        this.prizeSetId = prizeSetId;
    }

    public int getPrizeSetType() {
        return prizeSetType;
    }

    public void setPrizeSetType(int prizeSetType) {
        this.prizeSetType = prizeSetType;
    }

    public int getPrizeSetState() {
        return prizeSetState;
    }

    public void setPrizeSetState(int prizeSetState) {
        this.prizeSetState = prizeSetState;
    }

}