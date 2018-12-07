package com.ningyang.os.action.input.command.api;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/12/06 15:33
 * @描述：仓库下单
 */
public class ApiWarehouseSaleOrderCommand {
    //经销商id
    private Long dealerId;
    //创建人
    private Long createUserId;
    //备注
    private String remark;
    //明细
    private List<ApiWarehouseOrderDetailCommand> detailList;

    public Long getDealerId() {
        return dealerId;
    }

    public void setDealerId(Long dealerId) {
        this.dealerId = dealerId;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<ApiWarehouseOrderDetailCommand> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<ApiWarehouseOrderDetailCommand> detailList) {
        this.detailList = detailList;
    }
}
