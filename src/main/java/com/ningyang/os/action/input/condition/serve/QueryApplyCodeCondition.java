package com.ningyang.os.action.input.condition.serve;

/**
 * @Author： kaider
 * @Date：2018/11/21 10:11
 * @描述：溯源码申请
 */
public class QueryApplyCodeCondition {

    //模板表名
    private String tableName;
    //溯源码订单
    private String codeOrder;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getCodeOrder() {
        return codeOrder;
    }

    public void setCodeOrder(String codeOrder) {
        this.codeOrder = codeOrder;
    }
}
