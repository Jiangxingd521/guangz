package com.ningyang.os.action.input.command.web.serve;

import lombok.Data;

/**
 * @Author： kaider
 * @Date：2018/11/30 13:04
 * @描述：会员积分规则
 */
@Data
public class MemberPointRuleCommand {

    private Long ruleId;

    private String ruleName;

    private int ruleValue;

    private Long userId;

    private int ruleState = 0;
}
