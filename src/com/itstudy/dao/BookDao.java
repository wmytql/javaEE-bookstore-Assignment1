package com.itstudy.dao;

import com.itstudy.bean.Book;
import com.itstudy.bean.CartItem;
import com.itstudy.bean.Page;

import java.util.Collection;
import java.util.List;

/**
 * Author: LUOJIAN
 * Date: 2021/4/15
 * Time: 17:27
 * Decription:
 */
public interface BookDao {

    /**
     * 获取价格区间的图书信息
     * @param page
     * @return
     */
    List<Book> getBookByPrice(Page<Book> page,double min,double max);

    /**
     * 获取价格区间的图书总记录数
     * @param min
     * @param max
     * @return
     */
    int getCountByPrice(double min, double max);

    /**
     * 获取图书的总记录数
     * @return
     */
    int getCount();

    /**
     * 获取当前页的图书信息
     * @param page
     * @return
     */
    List<Book> getBookByPage(Page<Book> page);


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
     * 修改图书信息
     * @param book
     */
    void updateBook(Book book);

    /**
     * 根据图书的ID查询一本图书
     * @param bookId
     * @return
     */
    Book getBookById(String bookId);


    /**
     * 更新图书的销量库存
     * @param cartItems
     * @return
     */
    int[] batchUpdateStockAndSales(Collection<CartItem> cartItems);
}
