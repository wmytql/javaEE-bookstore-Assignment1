package com.itstudy.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Author: LUOJIAN
 * Date: 2021/4/21
 * Time: 11:53
 * Decription: 购物车
 */
public class Cart implements Serializable {


    private Map<String, CartItem> map = new LinkedHashMap<>();

    private Integer totalCount;

    private Double totalAmount;

    public Map<String, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<String, CartItem> map) {
        this.map = map;
    }

    public Integer getTotalCount() {
        totalCount = 0;
        for (CartItem cartItem : getCartItemList()) {
            totalCount += cartItem.getCount();
        }
        return totalCount;
    }

    public Double getTotalAmount() {
        BigDecimal bigDecimal1 = new BigDecimal("0.0");
        for (CartItem cartItem : getCartItemList()) {
            BigDecimal bigDecimal2 = new BigDecimal(cartItem.getAmount()+"");
            bigDecimal1 = bigDecimal1.add(bigDecimal2);
        }
        return bigDecimal1.doubleValue();
    }

    /**
     * 获取购物车中所有购物项
     */
    public List<CartItem> getCartItemList(){
        return new ArrayList<>(map.values());
    }

    /**
     * 加入购物车（添加购物项）
     */
    public void addCartItem(Book book){
        //获取图书的id
        String bookId = book.getId() + "";
        //通过bookId获取map集合中的购物项
        CartItem cartItem = map.get(bookId);
        //判断cartItem是否为null
        if(cartItem == null){
            //表示购物车中没有此图书所对应的购物项，是第一次添加到购物车，需要通过book对象创建购物项
            cartItem = new CartItem();
            cartItem.setBook(book);
            cartItem.setCount(1);
        }else{
            //表示购物车中有此图书所对应的购物项，需要将购物项的数量+1
            cartItem.setCount(cartItem.getCount()+1);
        }
        //将cartItem对象重新保存到map中
        map.put(bookId, cartItem);
    }

    /**
     * 删除购物项
     */
    public void deleteCartItem(String bookId){
        map.remove(bookId);
    }

    /**
     * 清空购物车
     */
    public void clearCart(){
        map.clear();
    }

    /**
     * 更新图书的数量
     */
    public void updateCount(String bookId, String countStr){
        //根据bookId获取购物项
        CartItem cartItem = map.get(bookId);
        try {
            //将countStr转换为数值类型
            int count = Integer.parseInt(countStr);
            //若count>0，则更新购物项的数量
            if(count > 0){
                cartItem.setCount(count);
            }
            //若count=0，则将购物项删除
            if(count == 0){
                map.remove(bookId);
            }
            //若count<0，则不做任何操作
        } catch (NumberFormatException e) { }
    }

}
