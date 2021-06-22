package com.itstudy.dao.Impl;

import com.itstudy.bean.Book;
import com.itstudy.bean.CartItem;
import com.itstudy.bean.Page;
import com.itstudy.dao.BookDao;
import com.itstudy.util.BaseDao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


public class BookDaoImpl extends BaseDao<Book> implements BookDao {


    @Override
    public List<Book> getBookByPrice(Page<Book> page, double min, double max) {
        String sql = "select id,title,author,price,sales,stock,img_path as imgPath from bs_book where price between ? and ? limit ?,?";
        return getBeanList(Book.class,sql,min,max,page.getIndex(),page.getPageSize());
    }

    @Override
    public int getCountByPrice(double min, double max) {
        String sql = "select count(id) from bs_book where price between ? and ?";
        Long count = (Long) getSingleData(sql, min, max);
        return count.intValue();
    }


    @Override
    public int getCount() {
        String sql = "select count(id) from bs_book";
        Long count = (Long)getSingleData(sql);
        return count.intValue();
    }

    @Override
    public List<Book> getBookByPage(Page<Book> page) {
        String sql = "select id,title,author,price,sales,stock,img_path as imgPath from bs_book limit ? , ?";
        return getBeanList(Book.class,sql,page.getIndex(),page.getPageSize());
    }


    @Override
    public void deleteBook(int bookId) {
        //定义sql
        String sql = "delete from bs_book where id = ?";
        //执行sql
        update(sql,bookId);

    }

    @Override
    public void addBook(Book book) {
        //定义sql
        String sql = "insert into bs_book values(null,?,?,?,?,?,?)";
        //执行sql
        update(sql,book.getTitle(),book.getAuthor(),book.getPrice(),book.getSales(),book.getStock(),book.getImgPath());
    }



    @Override
    public void updateBook(Book book) {
        //定义sql
        String sql = "update bs_book set title=?,author=?,price=?,sales=?,stock=? where id = ?";
        update(sql, book.getTitle(), book.getAuthor(), book.getPrice(), book.getSales(), book.getStock(), book.getId());
    }

    @Override
    public Book getBookById(String bookId) {
        //将bookId转为int
        int id = Integer.parseInt(bookId);
        //定义sql
        String sql = "select id,title,author,price,sales,stock,img_path as imgPath from bs_book where id = ?";
        //执行sql
        Book book = getBean(Book.class, sql, id);
        return book;
    }

    @Override
    public int[] batchUpdateStockAndSales(Collection<CartItem> cartItems) {
        //定义二维数组
        Object[][] params = new Object[cartItems.size()][];

        //将collection集合转换为list
        List<CartItem> cartItemList = new ArrayList<>(cartItems);

        //遍历
        for (int i = 0; i < cartItemList.size(); i++) {
            CartItem cartItem = cartItemList.get(i);
            Object[] paramArr = new Object[3];
            Book book = cartItem.getBook();

            paramArr[0] = cartItem.getCount();
            paramArr[1] = cartItem.getCount();
            paramArr[2] = book.getId();

            //将一维数组存入二维数组
            params[i] = paramArr;
        }
        //定义sql
        String sql = "UPDATE bs_book SET stock=stock-?, sales=sales+? WHERE id=?";

        return batch(sql,params);

    }


}
