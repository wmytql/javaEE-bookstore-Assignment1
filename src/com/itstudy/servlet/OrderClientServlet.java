package com.itstudy.servlet;

import com.itstudy.bean.Cart;
import com.itstudy.bean.User;
import com.itstudy.serive.Impl.OrderServiceImpl;
import com.itstudy.serive.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Author: LUOJIAN
 * Date: 2021/4/23
 * Time: 18:29
 * Decription:
 */
public class OrderClientServlet extends BaseServlet {

    OrderService orderService = new OrderServiceImpl();

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取session
        HttpSession session = request.getSession();
        //获取session中的user
        User user = (User) session.getAttribute("user");

        if (user == null) {
            //未登录
            //设置提示信息
            request.setAttribute("Msg","结算前请先登录");
            //转发到登录页面
            request.getRequestDispatcher("/pages/user/login.jsp").forward(request,response);
            //结束
            return;
        }

        //处理登录后的情况
        //获取购物车信息
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            //没有可结算的订单 重定向到主页
            response.sendRedirect(request.getContextPath()+"/");
            return;
        }

        //调用service处理结账业务逻辑
        String orderSequence = orderService.check(cart, user);

        //存入session
        session.setAttribute("orderSequence",orderSequence);

        //重定向到checkout.jsp页面
        response.sendRedirect(request.getContextPath()+"/pages/cart/checkout.jsp");


    }

}
