package com.ningyang.os.action.input.command.web.base;

/**
 * @Author： kaider
 * @Date：2018/10/02 13:40
 * @描述：角色
 */
public class RoleCommand {

    private Long roleId;

    private String roleName;

    private Integer roleState;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getRoleState() {
        return roleState;
    }

    public void setRoleState(Integer roleState) {
        this.roleState = roleState;
    }
}
