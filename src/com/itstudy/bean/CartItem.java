package com.itstudy.bean;

import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem implements Serializable {

    private Double amount;  //金额

    private Integer count;      //数量

    private Book book;      //图书信息


    /**
     * 获取购物项的的金额
     * @return
     */
    public Double getAmount() {
        BigDecimal bigDecimal1 = new BigDecimal(book.getPrice()+"");
        BigDecimal bigDecimal2 = new BigDecimal(count + "");
        return bigDecimal1.multiply(bigDecimal2).doubleValue();
    }


    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}
