package com.ningyang.os.action.input.command.web.base;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/10/04 23:55
 * @描述：
 */
public class UserRoleCommand {

    private Long userId;

    private List<Long> ids;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public List<Long> getIds() {
        return ids;
    }

    public void setIds(List<Long> ids) {
        this.ids = ids;
    }
}
