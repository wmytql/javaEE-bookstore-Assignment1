package com.itstudy.bean;

import java.util.List;


public class Page<T> {


    private String pageNoStr;   //字符串页码

    private int pageSize;       //每页显示的条数

    private int totalCount;     //总记录数

    private String path;        //当前访问的路径


    private int pageNo;         //当前页真正的页码（将pageNoStr转换之后，且处理了特殊情况的页码）

    private int totalPage;      //总页数

    private int index;          //当前页的起始索引

    private List<T> list;       //分页数据

    public String getPageNoStr() {
        return pageNoStr;
    }

    public void setPageNoStr(String pageNoStr) {
        this.pageNoStr = pageNoStr;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageNo() {
        //将字符串页码转为数字页码
        pageNo = 1;//发生类型转换异常后pageNo的值
        try {
            pageNo = Integer.parseInt(pageNoStr);
        } catch (NumberFormatException e) {
        }

        if (pageNo > getTotalPage()) {
            pageNo = getTotalPage();
        }

        if (pageNo < 1) {
            pageNo = 1;
        }

        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }


    public int getTotalPage() {
        totalPage = totalCount / pageSize;
        if (totalCount % pageSize != 0) {
            totalPage += 1;
        }
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getIndex() {
        return (getPageNo() - 1) * pageSize;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
