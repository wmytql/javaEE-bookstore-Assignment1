package com.itstudy.servlet;

import com.itstudy.bean.User;
import com.itstudy.serive.Impl.UserServiceImpl;
import com.itstudy.serive.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Author: LUOJIAN
 * Date: 2021/4/15
 * Time: 14:18
 * Decription: 整合登录和注册
 */
public class UserServlet extends BaseServlet {

    //创建service层实现类
    UserService userService = new UserServiceImpl();




    /**
     * 注销功能
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取session
        HttpSession session = request.getSession();
        //销毁session
        session.invalidate();
        //重定向到首页
        response.sendRedirect(request.getContextPath()+"/");
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取请求数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //调用service处理业务逻辑，验证登录
        User user = userService.checkLogin(username, password);
        if (user != null) {
            //登录成功
            //将用户对象存入session中
            request.getSession().setAttribute("user", user);
            //如果用户名和密码正确 重定向到登录成功页面
            response.sendRedirect(request.getContextPath() + "/pages/user/login_success.jsp");
        } else {
            //登录失败
            //将错误信息放入request域中转发到登录页面
            request.setAttribute("Msg", "用户名或密码错误");
            //存入错误信息账号，回显错误账户
            request.setAttribute("username",username);
            //转发到登录页面
            request.getRequestDispatcher("pages/user/login.jsp").forward(request, response);
        }
    }

    protected void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String code = request.getParameter("code");
        //获取session对象
        HttpSession session = request.getSession();
        //获取正确的验证码
        String sessionCode = (String) session.getAttribute("sessionCode");
        //比较验证码
        if (sessionCode.equals(code)) {
            //验证码正确
            //将用户输入的数据封装为user1对象
            User user1 = new User(null, username, password, email);
            //调用service处理业务逻辑，注册
            //注册成功后返回的user中Id不等于空
            User user = userService.regist(user1);
            //判断是否注册成功
            if (user.getId() != null) {
                //注册成功
                //将用户对象存入session
                request.getSession().setAttribute("user",user);
                //重定向到注册成功页面
                response.sendRedirect(request.getContextPath()+"/pages/user/regist_success.jsp");
            } else {
                //注册失败
                // 将错误信息存入request域中
                request.setAttribute("error_Msg","用户名已存在,请重新注册");
                request.setAttribute("user",user1);
                //转发到当前页面
                request.getRequestDispatcher("pages/user/regist.jsp").forward(request,response);
            }
        } else {
            //验证码错误
            // 将错误信息存入request域中
            request.setAttribute("error_Msg","验证码错误");
            //转发到当前页面
            request.getRequestDispatcher("pages/user/regist.jsp").forward(request,response);
        }
    }


    protected void checkUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
