package com.billow.aop.global.commons;

/**
 * 分页数据
 *
 * @author liuyongtao
 * @create 2019-11-01 9:07
 */
public class CustomPage {
    private Object tableData;
    private long recordCount;
    private long totalPages;

    public Object getTableData() {
        return tableData;
    }

    public CustomPage setTableData(Object tableData) {
        this.tableData = tableData;
        return this;
    }

    public long getRecordCount() {
        return recordCount;
    }

    public CustomPage setRecordCount(long recordCount) {
        this.recordCount = recordCount;
        return this;
    }

    public long getTotalPages() {
        return totalPages;
    }

    public CustomPage setTotalPages(long totalPages) {
        this.totalPages = totalPages;
        return this;
    }
}
