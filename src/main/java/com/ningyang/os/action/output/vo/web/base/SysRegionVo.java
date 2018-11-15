package com.ningyang.os.action.output.vo.web.base;

import com.ningyang.os.action.utils.TreeEntity;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/12 18:09
 * @描述：区域
 */
public class SysRegionVo implements TreeEntity<SysRegionVo> {

    private String id;

    private String parentId;

    //名称
    private String label;

    private String value;

    //子菜单
    private List<SysRegionVo> children;


    @Override
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public List<SysRegionVo> getChildren() {
        return children;
    }

    @Override
    public void setChildren(List<SysRegionVo> children) {
        this.children = children;
    }
}
