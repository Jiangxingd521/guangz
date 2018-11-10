package com.ningyang.os.action.input.command.web.base;

/**
 * @Author： kaider
 * @Date：2018/10/21 16:13
 * @描述：用户密码
 */
public class UserPwdCommand {

    private String userId;

    private String userPassword;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
}
