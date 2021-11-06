package mybean.data;

import com.sun.rowset.CachedRowSetImpl;

public class ShowBypage {
    //存储表中全部记录的行集对象
    CachedRowSetImpl rowSet = null;
    //每页显示的记录数
    int pageSize = 10;
    //分页后的总页数
    int pageAllCount = 0;
    //当前显示的页数
    int showPage = 1;
    //显示当前页内容
    StringBuffer presentPageResult;

    public CachedRowSetImpl getRowSet() {
        return rowSet;
    }

    public void setRowSet(CachedRowSetImpl rowSet) {
        this.rowSet = rowSet;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageAllCount() {
        return pageAllCount;
    }

    public void setPageAllCount(int pageAllCount) {
        this.pageAllCount = pageAllCount;
    }

    public int getShowPage() {
        return showPage;
    }

    public void setShowPage(int showPage) {
        this.showPage = showPage;
    }

    public StringBuffer getPresentPageResult() {
        return presentPageResult;
    }

    public void setPresentPageResult(StringBuffer presentPageResult) {
        this.presentPageResult = presentPageResult;
    }
}
