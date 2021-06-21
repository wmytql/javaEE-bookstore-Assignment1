package com.itstudy.dao;

import com.itstudy.bean.Order;

/**
 * Author: LUOJIAN
 * Date: 2021/4/23
 * Time: 18:50
 * Decription:
 */
public interface OrderDao {

    /**
     *  保存order对象
     * @param order
     * @return
     */
    int addOrder(Order order);
}
