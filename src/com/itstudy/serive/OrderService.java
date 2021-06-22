package com.itstudy.serive;

import com.itstudy.bean.Cart;
import com.itstudy.bean.User;

public interface OrderService {

    /**
     * 结账 返回订单号
     * @param cart
     * @param user
     * @return
     */
    String check(Cart cart, User user);

}
