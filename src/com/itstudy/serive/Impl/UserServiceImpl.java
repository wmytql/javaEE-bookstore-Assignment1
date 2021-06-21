package com.itstudy.serive.Impl;
import com.itstudy.bean.User;
import com.itstudy.dao.Impl.UserDaoImpl;
import com.itstudy.dao.UserDao;
import com.itstudy.serive.UserService;


/**
 * 处理用户模块的业务逻辑的实现类
 */
public class UserServiceImpl implements UserService {
    //创建userDao层实现类对象
    UserDao userDao = new UserDaoImpl();

    @Override
    public User checkLogin(String username, String password) {

        //将userDao层封装对象放入user
        return userDao.login(username, password);

    }




    @Override
    public User regist(User user) {

        //查询用户名是否存在
        User checkedUsername = userDao.checkedUsername(user);


        if (checkedUsername == null) {
            //用户名不存在 可以注册
            userDao.registUser(user);
            //获取注册用户id
            int userId = userDao.getRegistUserId(user);
            //将注册用户id填充到user对象中
            user.setId(userId);
        }


        return user;

    }
}
