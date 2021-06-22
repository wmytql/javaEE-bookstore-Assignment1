package com.itstudy.util;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {
    public static String getPath(HttpServletRequest request) {
        //获取当前的请求路径requestURI = /day07_BookStoreV2/BookClientServlet
        String requestURI = request.getRequestURI();
//        System.out.println("requestURI = " + requestURI);

        //获取请求地址后拼接的请求参数method=getPage&pageNo=2
        String queryString = request.getQueryString();
//        System.out.println("queryString = " + queryString);

        //判断queryString中是否包含pageNo
        if (queryString.contains("&pageNo")) {
            queryString = queryString.substring(0,queryString.indexOf("&pageNo"));
        }

//        System.out.println("queryString = " + queryString);
        return requestURI + "?" + queryString;
    }
}
