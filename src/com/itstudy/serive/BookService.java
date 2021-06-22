package com.itstudy.serive;

import com.itstudy.bean.Book;
import com.itstudy.bean.Page;

import java.util.List;

public interface BookService {

    /**
     * 获取价格区间的图书信息
     * @param page
     * @param min
     * @param max
     * @return
     */
    Page<Book> getPageByPrice(Page<Book> page, double min, double max);

    /**
     * 获取当前页的图书信息
     * @param page
     * @return
     */
    Page<Book> getPage(Page<Book> page);



    /**
     * 删除图书
     * @param bookId
     */
    void deleteBook(int bookId);

    /**
     * 添加图书
     * @param book
     */
    void addBook(Book book);

    /**
     * 修改图书
     * @param book
     */
    void updateBook(Book book);

    /**
     * 查询图书
     * @param bookId
     * @return
     */
    Book getBookById(String bookId);



}
