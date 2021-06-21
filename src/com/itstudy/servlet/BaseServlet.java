package com.itstudy.servlet;

import com.itstudy.bean.User;
import com.itstudy.serive.Impl.UserServiceImpl;
import com.itstudy.serive.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Author: LUOJIAN
 * Date: 2021/4/15
 * Time: 15:15
 * Decription:  创建BaseServlet
 */
public class BaseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码格式
        request.setCharacterEncoding("UTF-8");
        //设置响应编码格式
        response.setContentType("text/html;charset=UTF-8");
        //通过反射的形式动态获取方法对象
        try {
            //获取方法名
            String methodName = request.getParameter("method");
            //根据方法名和参数类型获取方法的对象
            Method method = this.getClass().getDeclaredMethod(methodName,HttpServletRequest.class,HttpServletResponse.class);
            //设置访问权限
            method.setAccessible(true);
            //调用方法
            method.invoke(this,request,response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

}
