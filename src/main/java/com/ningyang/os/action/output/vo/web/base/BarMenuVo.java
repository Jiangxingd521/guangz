package com.ningyang.os.action.output.vo.web.base;

import com.ningyang.os.action.utils.TreeEntity;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/10/01 16:17
 * @描述：导航栏对应的菜单
 */
public class BarMenuVo implements TreeEntity<BarMenuVo> {
    //菜单id
    private String id;
    //父菜单id
    private String parentId;
    //菜单名
    private String label;
    //菜单链接
    private String href;
    //图标
    private String icon;
    //子菜单
    private List<BarMenuVo> children;

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

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public List<BarMenuVo> getChildren() {
        return children;
    }

    @Override
    public void setChildren(List<BarMenuVo> children) {
        this.children = children;
    }
}
