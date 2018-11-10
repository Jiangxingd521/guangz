package com.ningyang.os.action.output.dto.web;

/**
 * @Author： kaider
 * @Date：2018/09/27 14:58
 * @描述：用户角色信息
 */
public class UserRoleDto {

    private Long id;

    private Long userId;

    private Long roleId;

    private int roleFlag;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public int getRoleFlag() {
        return roleFlag;
    }

    public void setRoleFlag(int roleFlag) {
        this.roleFlag = roleFlag;
    }
}
