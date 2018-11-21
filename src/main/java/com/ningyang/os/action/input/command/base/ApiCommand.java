package com.ningyang.os.action.input.command.base;

/**
 * @Author： kaider
 * @Date：2018/11/19 17:49
 * @描述：接口用
 */
public class ApiCommand {
    //用户授权码
    private String userCode;
    //接口授权码
    private String apiCode;

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getApiCode() {
        return apiCode;
    }

    public void setApiCode(String apiCode) {
        this.apiCode = apiCode;
    }
}
