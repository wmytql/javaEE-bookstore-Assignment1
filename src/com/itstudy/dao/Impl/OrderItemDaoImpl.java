package com.itstudy.dao.Impl;

import com.itstudy.bean.Book;
import com.itstudy.bean.CartItem;
import com.itstudy.bean.Order;
import com.itstudy.dao.OrderItemDao;
import com.itstudy.util.BaseDao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class OrderItemDaoImpl extends BaseDao<Order> implements OrderItemDao {
    @Override
    public int[] batchAddOrderItem(Integer orderId, Collection<CartItem> cartItems) {

        //创建二维数组
        //二维数组中第一维的长度等于cartItems集合的长度
        Object[][] params = new Object[cartItems.size()][];

        //将collection集合转为list
        List<CartItem> cartItemList = new ArrayList<>(cartItems);

        //遍历所有的订单项
        for (int i = 0; i < cartItemList.size(); i++) {

            CartItem cartItem = cartItemList.get(i);
            // 从CartItem对象中取出具体参数数据
            Book book = cartItem.getBook();
            // 注意：一维数组的长度和SQL语句中问号的数量一致
            Object[] paramArr = new Object[6];
            // 将具体参数数据封装到一维数组中
            paramArr[0] = book.getTitle();
            paramArr[1] = book.getPrice();
            paramArr[2] = book.getImgPath();
            paramArr[3] = cartItem.getCount();
            paramArr[4] = cartItem.getAmount();
            paramArr[5] = orderId;

            //将一维数组存入二维数组
            params[i] = paramArr;

        }

        //编写sql
        String sql = "INSERT INTO bs_order_item(book_name,price,img_path,item_count,item_amount,order_id) VALUES(?,?,?,?,?,?)";

        //调用通用的批量操作方法执行保存
        return batch(sql, params);


    }
}
