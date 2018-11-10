package com.ningyang.os.action.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Author： kaider
 * @Date：2018/08/02 16:50
 * @描述：系统自定义配置
 */
@Component
@ConfigurationProperties(prefix = "os-config")
public class SystemConfig {
    //域名
    private String defaultTemplateUrl;
    //默认密码
    private String defaultPassword;
    //秘钥
    private String defaultApiKey;
    //二维码默认基底数
    private int defaultQRCodeNumber;
    //二维码模板
    private String defaultQRCodeTemplate;
    //企业二维码表模板
    private String defaultQRCodeTemplateTable;

    public String getDefaultTemplateUrl() {
        return defaultTemplateUrl;
    }

    public void setDefaultTemplateUrl(String defaultTemplateUrl) {
        this.defaultTemplateUrl = defaultTemplateUrl;
    }

    public String getDefaultPassword() {
        return defaultPassword;
    }

    public void setDefaultPassword(String defaultPassword) {
        this.defaultPassword = defaultPassword;
    }

    public String getDefaultApiKey() {
        return defaultApiKey;
    }

    public void setDefaultApiKey(String defaultApiKey) {
        this.defaultApiKey = defaultApiKey;
    }

    public int getDefaultQRCodeNumber() {
        return defaultQRCodeNumber;
    }

    public void setDefaultQRCodeNumber(int defaultQRCodeNumber) {
        this.defaultQRCodeNumber = defaultQRCodeNumber;
    }

    public String getDefaultQRCodeTemplate() {
        return defaultQRCodeTemplate;
    }

    public void setDefaultQRCodeTemplate(String defaultQRCodeTemplate) {
        this.defaultQRCodeTemplate = defaultQRCodeTemplate;
    }

    public String getDefaultQRCodeTemplateTable() {
        return defaultQRCodeTemplateTable;
    }

    public void setDefaultQRCodeTemplateTable(String defaultQRCodeTemplateTable) {
        this.defaultQRCodeTemplateTable = defaultQRCodeTemplateTable;
    }
}


