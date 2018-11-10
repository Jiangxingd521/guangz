package com.ningyang.os.action.input.condition.common;

import java.io.Serializable;

/**
 * @Author： kaider
 * @Date：2018/08/30 17:22
 * @描述：
 */
public class BaseCondition implements Serializable {
    //页数
    private int page = 0;
    //条数
    private int limit = 10;

    public BaseCondition() {

    }

    public BaseCondition(int page, int limit) {
        this.page = page;
        this.limit = limit;
    }

    public int getPage() {
        if (page == 0) {
            page = 1;
        }
        return (page - 1) * limit;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public Integer getCurrentPage() {
        Integer currentPage = this.page;
        if (currentPage == null || currentPage == 0) {
            return 1;
        }
        return currentPage;
    }
}
