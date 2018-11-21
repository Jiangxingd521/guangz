package com.ningyang.os.action.input.command.web.serve;

import com.ningyang.os.pojo.SerApplyCodeTemplate;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/21 10:09
 * @描述：溯源码模板
 */
public class TemplateCodeCommand {

    private String tableName;

    private List<SerApplyCodeTemplate> list;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<SerApplyCodeTemplate> getList() {
        return list;
    }

    public void setList(List<SerApplyCodeTemplate> list) {
        this.list = list;
    }
}
