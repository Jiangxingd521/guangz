package com.ningyang.os.action.input.condition.base;

import com.ningyang.os.action.input.condition.common.BaseCondition;

/**
 * @Author： kaider
 * @Date：2018/09/28 16:50
 * @描述：菜单
 */
public class QueryMenuCondition extends BaseCondition {
    //导航栏状态
    private Integer barState;
    //菜单状态
    private String menuState;
    //用户id
    private String userId;
    //父id
    private String pid;
    //顺序
    private Integer sort;
    //导航栏id
    private Long barId = 0L;
    //菜单类型
    private Integer menuType = 0;

    public Integer getBarState() {
        return barState;
    }

    public void setBarState(Integer barState) {
        this.barState = barState;
    }

    public String getMenuState() {
        return menuState;
    }

    public void setMenuState(String menuState) {
        this.menuState = menuState;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Long getBarId() {
        return barId;
    }

    public void setBarId(Long barId) {
        this.barId = barId;
    }

    public Integer getMenuType() {
        return menuType;
    }

    public void setMenuType(Integer menuType) {
        this.menuType = menuType;
    }
}
