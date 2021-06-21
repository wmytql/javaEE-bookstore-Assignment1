package com.itstudy.serive;

import com.itstudy.bean.User;

/**
 *   处理用户模块的业务逻辑接口
 */
public interface UserService {

    /**
     * 验证登录
     * @param username
     * @param password
     * @return
     */
    User checkLogin(String username, String password);

    /**
     * 用户注册
     * @param user
     * @return
     */
    User regist(User user);


}
