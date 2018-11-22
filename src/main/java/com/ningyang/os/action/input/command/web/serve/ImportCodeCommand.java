package com.ningyang.os.action.input.command.web.serve;

/**
 * @Author： kaider
 * @Date：2018/11/22 14:59
 * @描述：溯源码导入数据
 */
public class ImportCodeCommand {
    //上传的文件名称
    private String importFileName;
    //
    private String saveFilePath;
    //操作人
    private Long userId;
    //导入的数量
    private Long codeCount;
    //模板id
    private Long templateId;

    public String getImportFileName() {
        return importFileName;
    }

    public void setImportFileName(String importFileName) {
        this.importFileName = importFileName;
    }

    public String getSaveFilePath() {
        return saveFilePath;
    }

    public void setSaveFilePath(String saveFilePath) {
        this.saveFilePath = saveFilePath;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getCodeCount() {
        return codeCount;
    }

    public void setCodeCount(Long codeCount) {
        this.codeCount = codeCount;
    }

    public Long getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Long templateId) {
        this.templateId = templateId;
    }
}
