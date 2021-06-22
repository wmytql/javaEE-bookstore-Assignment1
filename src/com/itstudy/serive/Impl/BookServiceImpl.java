package com.itstudy.serive.Impl;

import com.itstudy.bean.Book;
import com.itstudy.bean.Page;
import com.itstudy.dao.BookDao;
import com.itstudy.dao.Impl.BookDaoImpl;
import com.itstudy.serive.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {


    private BookDao dao = new BookDaoImpl();


    @Override
    public Page<Book> getPage(Page<Book> page) {

        //获取图书的总记录数
        int totalCount = dao.getCount();
//        System.out.println("totalCount = " + totalCount);
        //将totalCount封装到page对象中
        page.setTotalCount(totalCount);

        //通过page对象获取图书的分页信息
        List<Book> list = dao.getBookByPage(page);
//        System.out.println("list = " + list);
        //将list集合封装到page对象中
        page.setList(list);
        return page;
    }

    @Override
    public Page<Book> getPageByPrice(Page<Book> page, double min, double max) {
        //获取图书的总记录数
        int totalCount = dao.getCountByPrice(min,max);
        //将totalCount封装到page对象中
        page.setTotalCount(totalCount);

        //通过page对象获取图书的分页信息
        List<Book> list = dao.getBookByPrice(page,min,max);
        //将list集合封装到page对象中
        page.setList(list);

        return page;
    }



    @Override
    public void deleteBook(int bookId) {
        dao.deleteBook(bookId);

    }

    @Override
    public void addBook(Book book) {

        dao.addBook(book);
    }



    @Override
    public void updateBook(Book book) {
        dao.updateBook(book);
    }


    @Override
    public Book getBookById(String bookId) {
        return dao.getBookById(bookId);
    }




}
