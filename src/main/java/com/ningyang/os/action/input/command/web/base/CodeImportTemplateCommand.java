package com.ningyang.os.action.input.command.web.base;

/**
 * @Author： kaider
 * @Date：2018/11/14 14:20
 * @描述：码模板
 */
public class CodeImportTemplateCommand {

    private Long templateId;

    private Long productId;

    private String templateName;

    private Long leftCodeType;

    private Long leftCodeId;

    private Long rightCodeId;

    private String templateRemark;

    private int templateState;

    public Long getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Long templateId) {
        this.templateId = templateId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public Long getLeftCodeType() {
        return leftCodeType;
    }

    public void setLeftCodeType(Long leftCodeType) {
        this.leftCodeType = leftCodeType;
    }

    public Long getLeftCodeId() {
        return leftCodeId;
    }

    public void setLeftCodeId(Long leftCodeId) {
        this.leftCodeId = leftCodeId;
    }

    public Long getRightCodeId() {
        return rightCodeId;
    }

    public void setRightCodeId(Long rightCodeId) {
        this.rightCodeId = rightCodeId;
    }

    public String getTemplateRemark() {
        return templateRemark;
    }

    public void setTemplateRemark(String templateRemark) {
        this.templateRemark = templateRemark;
    }

    public int getTemplateState() {
        return templateState;
    }

    public void setTemplateState(int templateState) {
        this.templateState = templateState;
    }
}
