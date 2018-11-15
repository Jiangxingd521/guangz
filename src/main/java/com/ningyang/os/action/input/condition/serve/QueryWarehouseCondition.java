package com.ningyang.os.action.input.condition.serve;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/11/15 14:04
 * @描述：仓库
 */
public class QueryWarehouseCondition extends BaseCondition {
    //仓库状态
    private Integer warehouseState;

    public Integer getWarehouseState() {
        return warehouseState;
    }

    public void setWarehouseState(Integer warehouseState) {
        this.warehouseState = warehouseState;
    }

}
