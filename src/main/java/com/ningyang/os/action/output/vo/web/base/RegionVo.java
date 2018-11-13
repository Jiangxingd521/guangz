package com.ningyang.os.action.output.vo.web.base;

/**
 * @Author： kaider
 * @Date：2018/11/13 15:08
 * @描述：地区区域
 */
public class RegionVo {

    private String id;

    private String parentId;

    //名称
    private String label;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
