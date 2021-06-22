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

public class BookClientServlet extends BaseServlet {

    private BookService service = new BookServiceImpl();
    /**
     * 获取图书的分页信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void getPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从前台获取字符串页码
        String pageNoStr = request.getParameter("pageNo");
        //创建page实体类
        Page<Book> page = new Page<>();
        //给实体类赋值
        page.setPageNoStr(pageNoStr);
        page.setPageSize(10);
        page.setPath(WebUtils.getPath(request));
        //调用service层
        page = service.getPage(page);
        request.setAttribute("page",page);
        request.getRequestDispatcher("/pages/client/book_client.jsp").forward(request,response);
    }

    /**
     * 获取区间价格图书信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void getPageByPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String pageNoStr = request.getParameter("pageNo");
        String minPrice = request.getParameter("min");
        String maxPrice = request.getParameter("max");

        double min = 0;
        double max = Integer.MAX_VALUE;

        try {
            min = Double.parseDouble(minPrice);
        } catch (NumberFormatException e) { }

        try {
            max = Double.parseDouble(maxPrice);
        } catch (NumberFormatException e) { }

        //创建page对象
        Page<Book> page = new Page<>();
        page.setPageNoStr(pageNoStr);
        page.setPageSize(10);
        page.setPath(WebUtils.getPath(request));

        //调用service层获取完整的page对象
        page = service.getPageByPrice(page,min,max);

        //在request域中共享数据
        request.setAttribute("page",page);
        request.setAttribute("minPrice",min);
        request.setAttribute("maxPrice",max);

        System.out.println("page = " + page.getList());

        //转发到book_client.jsp
        request.getRequestDispatcher("/pages/client/book_client.jsp").forward(request,response);


    }

}
