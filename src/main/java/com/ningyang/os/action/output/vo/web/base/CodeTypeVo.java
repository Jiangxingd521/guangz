package com.ningyang.os.action.output.vo.web.base;

/**
 * @Author： kaider
 * @Date：2018/11/14 09:54
 * @描述：码类型
 */
public class CodeTypeVo {

    private Long codeId;

    private String codeName;
    //码类型（0：码模板，1：内外码，2：码类型）
    private int codeType;

    private int codeState;

    public Long getCodeId() {
        return codeId;
    }

    public void setCodeId(Long codeId) {
        this.codeId = codeId;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public int getCodeType() {
        return codeType;
    }

    public void setCodeType(int codeType) {
        this.codeType = codeType;
    }

    public int getCodeState() {
        return codeState;
    }

    public void setCodeState(int codeState) {
        this.codeState = codeState;
    }
}
