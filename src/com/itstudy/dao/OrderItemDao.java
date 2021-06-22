package com.itstudy.dao;

import com.itstudy.bean.CartItem;

import java.util.Collection;

public interface OrderItemDao {
    /**
     * 批量保存订单详情
     * @param orderId
     * @param cartItems
     * @return
     */
    int[] batchAddOrderItem(Integer orderId, Collection<CartItem> cartItems);
}
