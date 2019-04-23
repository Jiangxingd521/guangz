package com.ningyang.os.action.input.condition.base;

import com.ningyang.os.action.input.condition.common.BaseCondition;
import lombok.Data;

/**
 * @Author： kaider
 * @Date：2018/11/14 09:57
 * @描述：溯源码
 */
@Data
public class QueryCodeCondition extends BaseCondition {
    //码类型状态
    private Integer codeTypeState;
    //码模板状态
    private Integer codeImportState;
    //码申请状态
    private Integer applyCodeState;
    //产品
    private String productName;
    //系列
    private String seriesName;
    //品牌
    private String brandName;
    //申请编号
    private String codeOrder;
    //申请订单-简化版。表示那两笔订单是同一个申请下的数据。
    private String codeOrderSimplified;
}
