package com.ningyang.os.action.output.dto.web;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/09/27 14:37
 * @描述：用户信息
 */
public class UserInfoDto {

    private String username;

    private String name;

    private List<String> roles;

    private List<String> permission;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    public List<String> getPermission() {
        return permission;
    }

    public void setPermission(List<String> permission) {
        this.permission = permission;
    }
}
