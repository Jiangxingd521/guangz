package com.ningyang.os.action.output.vo.web.serve;

import lombok.Data;

import java.util.Date;

/**
 * @Author： kaider
 * @Date：2018/11/15 16:18
 * @描述：溯源码申请
 */
@Data
public class ApplyCodeVo {

    private Long applyId;

    private String codeOrder;

    private Long codeType;
    //码类型
    private String codeTypeName;

    private Long codePosition;
    //码位置
    private String codePositionName;

    private Long codePositionType;
    //码位置
    private String codePositionTypeName;
    //申请人
    private String applyUserName;
    //数量
    private int applyCount;
    //申请状态
    private int applyState;
    //溯源码存放表
    private String tableName;
    //申请时间
    private Date createTime;

    private String createTimeStr;

    /**
     * 模板id--溯源码发放简化版使用
     */
    private Long codeTemplateId;

    /**
     * 业务类型 正常业务0 简化版业务1
     */
    private Long businessTypeId;

    /**
     * 申请订单-简化版。表示那两笔订单是同一个申请下的数据。
     */
    private String codeOrderSimplified;

    //模板名称
    private String templateName;
}
