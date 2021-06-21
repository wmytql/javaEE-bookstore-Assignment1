package com.itstudy.servlet;

import com.itstudy.bean.Book;
import com.itstudy.bean.Cart;
import com.itstudy.bean.CartItem;
import com.itstudy.serive.BookService;
import com.itstudy.serive.Impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Author: LUOJIAN
 * Date: 2021/4/21
 * Time: 12:46
 * Decription:
 */
public class addCartServlet extends BaseServlet {
    private BookService bookService = new BookServiceImpl();


    /**
     * 修改购物项
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void updateCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取购物项id和数量
        String bookId = request.getParameter("bookId");
        String count = request.getParameter("count");
        //获取session对象
        HttpSession session = request.getSession();
        //获取cart
        Cart cart = (Cart) session.getAttribute("cart");
        //更新数量
        cart.updateCount(bookId,count);
        //重定向到来源页面
        response.sendRedirect(request.getHeader("referer"));

    }

    /**
     * 清空购物车
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void clearCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取session
        HttpSession session = request.getSession();
        //获取共享域中购物车对象
        Cart cart = (Cart) session.getAttribute("cart");
        //删除所有购物项
        cart.clearCart();
        //移出cart属性
        session.removeAttribute("cart");
        //重定向到来源页面
        response.sendRedirect(request.getHeader("referer"));
    }


    /**
     * 删除购物项
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取图书id
        String bookId = request.getParameter("id");
        //获取session对象
        HttpSession session = request.getSession();
        //获取共享域中的cart对象
        Cart cart = (Cart) session.getAttribute("cart");
        //删除购物项
        cart.deleteCartItem(bookId);

        //重定向到来源页面
        response.sendRedirect(request.getHeader("referer"));


    }

    /**
     * 加入购物车
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取图书id
        String book_id = request.getParameter("book_id");
        //获取session
        HttpSession session = request.getSession();
        //获取cart
        Cart cart = (Cart) session.getAttribute("cart");
        //判断购物车是否为空
        if (cart == null) {
            //若为空，创建购物车
            cart = new Cart();
        }
        //通过bookId获取图书信息
        Book book = bookService.getBookById(book_id);
        //添加购物项
        cart.addCartItem(book);
        //存入session
        session.setAttribute("cart",cart);
        //重定向到当前页面
        response.sendRedirect(request.getHeader("referer"));

    }


}
