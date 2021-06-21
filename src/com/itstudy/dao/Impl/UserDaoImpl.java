package com.itstudy.dao.Impl;

import com.itstudy.bean.User;
import com.itstudy.dao.UserDao;
import com.itstudy.util.BaseDao;
import com.itstudy.util.JDBCUtil;

import java.sql.*;

/**
 *   dao接口的实现类
 */
public class UserDaoImpl implements UserDao {

    //创建工具类BaoDao对象
    BaseDao<User> dao = new BaseDao<>();

    @Override
    public User login(String username, String password) {

        //定义查询sql
        String sql = "select * from bs_user where username = ? and password = ?";
        //返回封装对象
        return dao.getBean(User.class, sql, username, password);
    }

    @Override
    public User checkedUsername(User user) {
        //定义查询sql
        String sql = "select * from bs_user where username = ?";
        return dao.getBean(User.class, sql, user.getUsername());
    }

    @Override
    public void registUser(User user) {
        //定义注册的sql
        String sql = "insert into bs_user values(null,?,?,?)";
        //执行sql
        dao.update(sql, user.getUsername(), user.getPassword(), user.getEmail());

    }

    @Override
    public int getRegistUserId(User user) {
        // 获取数据库连接
        Connection conn = JDBCUtil.getConnection();

        // 声明PreparedStatement变量
        PreparedStatement ps = null;

        // 声明ResultSet变量
        ResultSet rs = null;

        int generatedKey = 0;

        //编写sql
        String sql = "insert into bs_user values(null,?,?,?)";

        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            ps.setString(3,user.getEmail());

            //执行sql
            ps.executeUpdate();
            //获取自增的主键
            rs = ps.getGeneratedKeys();

            //解析结果集
            rs.next();
            generatedKey = rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();

                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception e) {
                    e.printStackTrace();

                }
            }

        }
        return generatedKey;
    }
}
