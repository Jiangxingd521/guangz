package com.ningyang.os.action.output.dto.serve;

/**
 * @Author： kaider
 * @Date：2018/12/10 12:05
 * @描述：
 */
public class PutOutDto {
    private Boolean flag;

    private String message;

    private Object obj;

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }
}
