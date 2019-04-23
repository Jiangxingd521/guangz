package com.ningyang.os.action.input.command.web.serve;

import com.ningyang.os.action.input.command.base.ApiCommand;
import lombok.Data;

import java.util.Date;

/**
 * @Author： kaider
 * @Date：2018/11/15 18:07
 * @描述：溯源码申请
 */
@Data
public class ApplyCodeCommand extends ApiCommand {
    //
    private Long applyId;
    //申请人
    private Long applyUserId;
    //溯源码种类
    private Long codeType;
    //溯源码类型
    private Long codePosition;
    //溯源码位置类型
    private Long codePositionType;
    //码数量
    private Integer applyCount;
    //申请订单
    private String codeOrder;
    //溯源码模板
    private Long codeTemplate;
    //业务类型  正常业务0 和 简化版业务1
    private Long businessType;
    //申请订单-简化版。表示那两笔订单是同一个申请下的数据。
    private String codeOrderSimplified;
    //申请时间
    private Date applyDate;
}
