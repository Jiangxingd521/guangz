package com.ningyang.os.action.output.vo.web.base;

/**
 * @Author： kaider
 * @Date：2018/09/28 17:01
 * @描述：导航栏
 */
public class BarVo {
    private Long barId;
    private String barName;
    private String barPath;
    private String barIcon;
    private Integer barSort;
    private String barState;
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

    public Integer getBarSort() {
        return barSort;
    }

    public void setBarSort(Integer barSort) {
        this.barSort = barSort;
    }

    public String getBarState() {
        return barState;
    }

    public void setBarState(String barState) {
        this.barState = barState;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
