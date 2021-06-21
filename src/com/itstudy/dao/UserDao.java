package com.itstudy.dao;

import com.itstudy.bean.User;

/**
 * 操作数据库中的bs_user表
 */
public interface UserDao {

    /**
     * 通过用户名和密码查询User对象
     * @param username
     * @param password
     * @return
     */
    User login(String username, String password);

    /**
     * 查询用户名是否存在
     * @param user
     * @return
     */
    User checkedUsername(User user);

    /**
     * 注册用户
     * @param user
     */
    void registUser(User user);


    /**
     * 获取注册后自增的主键
     * @param user
     * @return
     */
    int getRegistUserId(User user);
}
