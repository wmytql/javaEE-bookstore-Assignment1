package com.itstudy.servlet;

import com.itstudy.bean.Book;
import com.itstudy.bean.Page;
import com.itstudy.serive.BookService;
import com.itstudy.serive.Impl.BookServiceImpl;
import com.itstudy.util.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Author: LUOJIAN
 * Date: 2021/4/15
 * Time: 17:32
 * Decription: 管理图书的增删改查
 */
public class BookManagerServlet extends BaseServlet {

    //创建service层实现类
    private BookService service = new BookServiceImpl();

    /**
     * 获取分页
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void getPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
//        System.out.println("requestURI = " + requestURI);
        //获取请求地址后拼接的请求参数
        String queryString = request.getQueryString();
//        System.out.println("queryString = " + queryString);
        //获取当前页页码
        String pageNoStr = request.getParameter("pageNo");
        //创建Page对象
        Page<Book> page = new Page<>();
        page.setPageNoStr(pageNoStr);
        page.setPageSize(5);
        page.setPath(WebUtils.getPath(request));
        //调用service处理处理业务逻辑,获取完整的page对象
        page = service.getPage(page);
        //将page对象在请求域中共享
        request.setAttribute("page",page);
        //转发到book_manager.jsp
        request.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(request,response);


    }



    /**
     * 删除图书的方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取id
        String id = request.getParameter("id");

//        将字符串转为整型  三种方式
//        Integer integer = new Integer(id);
//        Integer integer1 = Integer.valueOf(id);
        int bookId = Integer.parseInt(id);

        //根据id删除图书
        service.deleteBook(bookId);
        //重定向到图书列表页面
        response.sendRedirect(request.getHeader("referer"));
    }


    /**
     * 添加图书的方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取前台表单数据
        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int sale = Integer.parseInt(request.getParameter("sale"));
        int stock = Integer.valueOf(request.getParameter("stock"));
        Book book = new Book(null,bookName, author, price, sale, stock);
        //调用service层存入图书
        service.addBook(book);
        //重定向到图书列表页面
        response.sendRedirect(request.getContextPath()+"/BookManagerServlet?method=getPage&pageNo=1");
    }


    /**
     * 编辑图书的方法   点击修改按钮触发
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void editBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取参数id
        String id = request.getParameter("id");
        //根据id查询图书
        Book book = service.getBookById(id);
        //在request域中共享图书
        request.setAttribute("book",book);
        //转发至图书修改页面
        request.getRequestDispatcher("/pages/manager/book_edit.jsp").forward(request,response);
    }

    /**
     * 修改或添加图书的方法  点击编辑页面中的保存按钮触发
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void saveOrUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数id
        String id = request.getParameter("id");
        //如果id=""  说明是添加图书
        if ("".equals(id)) {
            //调用添加一本新书的servlet方法
            addBook(request,response);
        } else {
            //id有值,说明是修改图书
            //将String类型的id转换为int类型有可能会发生异常
            String id_Str = request.getParameter("id");
            int book_id = 1;
            //处理异常
            try {
                book_id = Integer.parseInt(id_Str);
            } catch (NumberFormatException e) {}

            // 获取修改后的表单数据
            String bookName = request.getParameter("bookName");
            String author = request.getParameter("author");
            double price = Double.parseDouble(request.getParameter("price"));
            int sale = Integer.parseInt(request.getParameter("sale"));
            int stock = Integer.valueOf(request.getParameter("stock"));
            Book book = new Book(book_id,bookName, author, price, sale, stock);
            //修改图书
            service.updateBook(book);
            //重定向
            response.sendRedirect(request.getContextPath()+"/BookManagerServlet?method=getPage&pageNo=1");
        }
    }


}
