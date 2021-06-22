package com.itstudy.filter;

import com.itstudy.util.JDBCUtil;
import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class TransactionFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        Connection connection = null;
        try {

            //获取数据库连接（隐含：从数据源获取数据库连接并绑定到当前线程上）
            connection = JDBCUtil.getConnection();
            //开启事务
            connection.setAutoCommit(false);
            //执行核心操作
            filterChain.doFilter(servletRequest, servletResponse);
            //如果核心操作成功：提交事务
            connection.commit();

        } catch (Throwable e) {
            // 如果核心操作失败：回滚事务
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();

                // 打印隐藏堆栈信息
                e.printStackTrace();
            }

            //显示错误页面
            String Error_msg = null;
            //获取当前异常的根本原因
            while(e.getCause() != null) {
                e = e.getCause();
                Error_msg = e.getMessage();
            }

            // 将异常信息存入Session域
            HttpServletRequest request = (HttpServletRequest)servletRequest;
            HttpSession session = request.getSession();
            //存入session域
            session.setAttribute("orderSequence",Error_msg);

            //重定向到checkout.jsp页面
            HttpServletResponse response = (HttpServletResponse)servletResponse;
            response.sendRedirect(request.getContextPath()+"/pages/cart/checkout.jsp");


            // 打印隐藏堆栈信息
            e.printStackTrace();


        } finally {
            JDBCUtil.closeConnection(connection);
        }
    }

    @Override
    public void destroy() {

    }
}
