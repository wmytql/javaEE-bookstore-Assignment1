package com.itstudy.dao;

import com.itstudy.bean.CartItem;

import java.util.Collection;

/**
 * Author: LUOJIAN
 * Date: 2021/4/23
 * Time: 19:21
 * Decription:
 */
public interface OrderItemDao {
    /**
     * 批量保存订单详情
     * @param orderId
     * @param cartItems
     * @return
     */
    int[] batchAddOrderItem(Integer orderId, Collection<CartItem> cartItems);
}
