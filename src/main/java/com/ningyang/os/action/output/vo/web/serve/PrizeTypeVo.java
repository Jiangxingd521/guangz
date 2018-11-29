package com.ningyang.os.action.output.vo.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/29 18:28
 * @描述：奖项类型
 */
public class PrizeTypeVo {

    private Long typeId;

    private String typeCode;

    private String typeName;

    private String typeContent;

    private int typeState;

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeContent() {
        return typeContent;
    }

    public void setTypeContent(String typeContent) {
        this.typeContent = typeContent;
    }

    public int getTypeState() {
        return typeState;
    }

    public void setTypeState(int typeState) {
        this.typeState = typeState;
    }
}
