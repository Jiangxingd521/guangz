package com.ningyang.os.action.input.command.web.base;

/**
 * @Author： kaider
 * @Date：2018/10/01 22:44
 * @描述：导航栏
 */
public class BarCommand {

    private Long barId;

    private String barName;

    private String barSort;

    private String barPath;

    private String barIcon;

    private Integer barState;

    private String remark;

    public Long getBarId() {
        return barId;
    }

    public void setBarId(Long barId) {
        this.barId = barId;
    }

    public String getBarName() {
        return barName;
    }

    public void setBarName(String barName) {
        this.barName = barName;
    }

    public String getBarSort() {
        return barSort;
    }

    public void setBarSort(String barSort) {
        this.barSort = barSort;
    }

    public String getBarPath() {
        return barPath;
    }

    public void setBarPath(String barPath) {
        this.barPath = barPath;
    }

    public String getBarIcon() {
        return barIcon;
    }

    public void setBarIcon(String barIcon) {
        this.barIcon = barIcon;
    }

    public Integer getBarState() {
        return barState;
    }

    public void setBarState(Integer barState) {
        this.barState = barState;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
