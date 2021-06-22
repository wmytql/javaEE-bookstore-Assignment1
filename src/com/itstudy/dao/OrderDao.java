package com.itstudy.dao;

import com.itstudy.bean.Order;

public interface OrderDao {

    /**
     *  保存order对象
     * @param order
     * @return
     */
    int addOrder(Order order);
}
