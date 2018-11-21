package com.ningyang.os.action.output.dto.serve;

/**
 * @Author： kaider
 * @Date：2018/11/21 09:34
 * @描述：溯源码
 */
public class CenterCodeDto {
    //码id
    private Long centerCodeId;
    //订单
    private String codeOrder;
    //码内容
    private String codeContent;

    public Long getCenterCodeId() {
        return centerCodeId;
    }

    public void setCenterCodeId(Long centerCodeId) {
        this.centerCodeId = centerCodeId;
    }

    public String getCodeOrder() {
        return codeOrder;
    }

    public void setCodeOrder(String codeOrder) {
        this.codeOrder = codeOrder;
    }

    public String getCodeContent() {
        return codeContent;
    }

    public void setCodeContent(String codeContent) {
        this.codeContent = codeContent;
    }
}
