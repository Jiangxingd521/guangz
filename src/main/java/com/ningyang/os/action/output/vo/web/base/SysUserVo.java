package com.ningyang.os.action.output.vo.web.base;

/**
 * @Author： kaider
 * @Date：2018/10/03 13:32
 * @描述：系统用户
 */
public class SysUserVo {
    //
    private Long userId;
    //
    private String userName;
    //
    private String loginName;
    //
    private Integer userType;
    //
    private Integer userState;
    //
    private Long pid;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer getUserState() {
        return userState;
    }

    public void setUserState(Integer userState) {
        this.userState = userState;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }
}
