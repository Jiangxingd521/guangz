package com.ningyang.os.action.output.dto.serve;

/**
 * @Author： kaider
 * @Date：2018/11/19 14:56
 * @描述：注册码
 */
public class RegisterCodeDto {

    private int codeType;

    private String codeName;

    public int getCodeType() {
        return codeType;
    }

    public void setCodeType(int codeType) {
        this.codeType = codeType;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }
}
