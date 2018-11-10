package com.ningyang.os.action.output.vo.web.base;

import com.ningyang.os.action.utils.TreeEntity;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/10/02 00:04
 * @描述：菜单
 */
public class SysMenuVo implements TreeEntity<SysMenuVo> {
    //菜单id
    private String id;
    //菜单父id
    private String parentId;
    //名称
    private String label;
    //标识
    private String code;
    //类型
    private Integer type;
    //排序
    private int sort;
    //路径
    private String path;
    //图标
    private String icon;
    //备注
    private String remark;
    //子菜单
    private List<SysMenuVo> children;

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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<SysMenuVo> getChildren() {
        return children;
    }

    @Override
    public void setChildren(List<SysMenuVo> children) {
        this.children = children;
    }
}
