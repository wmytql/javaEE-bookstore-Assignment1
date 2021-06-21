package com.itstudy.serive.Impl;

import com.itstudy.bean.*;
import com.itstudy.dao.BookDao;
import com.itstudy.dao.Impl.BookDaoImpl;
import com.itstudy.dao.Impl.OrderDaoImpl;
import com.itstudy.dao.Impl.OrderItemDaoImpl;
import com.itstudy.dao.OrderDao;
import com.itstudy.dao.OrderItemDao;
import com.itstudy.serive.OrderService;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

/**
 * Author: LUOJIAN
 * Date: 2021/4/23
 * Time: 18:49
 * Decription:
 */
public class OrderServiceImpl implements OrderService {

    //创建dao层对象
    OrderDao orderDao = new OrderDaoImpl();
    OrderItemDao orderItemDao = new OrderItemDaoImpl();
    BookDao bookDao = new BookDaoImpl();

    @Override
    public String check(Cart cart, User user) {

        //创建订单对象
        Order order = new Order();
        //填充oder对象
        // ①填充订单号
        String orderSequence = System.currentTimeMillis() +""+ user.getId();
        order.setOrderSequence(orderSequence);
        // ②填充订单创建时间
        String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        order.setCreateTime(createTime);
        // ③填充订单总数量
        order.setTotalCount(cart.getTotalCount());
        // ④填充订单总金额
        order.setTotalAmount(cart.getTotalAmount());
        // ⑤填充userId
        order.setUserId(user.getId());

        //保存order对象 在dao层获取自增的主键并为orderId赋值
        orderDao.addOrder(order);

        //从订单对象中获取自增主键
        Integer orderId = order.getOrderId();

        //保存订单详情（批量）
        Map<String, CartItem> cartMap = cart.getMap();
        Collection<CartItem> cartItems = cartMap.values();

        orderItemDao.batchAddOrderItem(orderId,cartItems);

        //更新图书库存 销量
        bookDao.batchUpdateStockAndSales(cartItems);

        //返回图书订单号
        return orderSequence;
    }
}
