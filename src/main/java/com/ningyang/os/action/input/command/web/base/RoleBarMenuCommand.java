package com.ningyang.os.action.input.command.web.base;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/10/02 15:52
 * @描述：角色授权
 */
public class RoleBarMenuCommand {

    private Long roleId;

    private List<Long> ids;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public List<Long> getIds() {
        return ids;
    }

    public void setIds(List<Long> ids) {
        this.ids = ids;
    }
}
