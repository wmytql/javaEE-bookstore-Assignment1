package com.itstudy.util;


import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 重构JDBCUtils类
 */
public class JDBCUtil {

    // 将数据源对象设置为静态属性，保证大对象的单一实例
    private static DataSource ds;

    //将ThreadLocal对象设置为静态成员变量，保证以此为键时从Map中取值能够取到同一个值
    private static ThreadLocal<Connection> threadLocal = new ThreadLocal<>();

    static {
        //1.创建一个用于存储外部属性文件信息的Properties对象
        Properties properties = new Properties();
        //2.使用当前类的类加载器加载外部属性文件：jdbc.properties
        InputStream inputStream = JDBCUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
        try {
            // 3.将外部属性文件jdbc.properties中的数据加载到properties对象中
            properties.load(inputStream);

            // 4.创建数据源对象
            ds = DruidDataSourceFactory.createDataSource(properties);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取连接
     * @return
     */
    public static Connection getConnection() {
        //从当前线程获取连接
        Connection conn = threadLocal.get();
        if (conn == null) {
            try {
                //如果当前线程没有连接那么获取一个 赋值给conn
                conn = ds.getConnection();
                //绑定到当前线程
                threadLocal.set(conn);
            } catch (SQLException e) {
                e.printStackTrace();

                throw new RuntimeException(e);
            }
        }
        //返回Connection对象
        return conn;

    }



    /**
     * 关闭连接，将连接对象返还druid数据源
     * @param connection
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                //将Connection对象从当前线程移除
                threadLocal.remove();
            } catch (SQLException e) {
                e.printStackTrace();

                throw new RuntimeException(e);
            }
        }
    }


    /**
     * 关闭JDBC的资源
     * @param conn
     * @param ps
     * @param rs
     */
    public static void close(Connection conn, PreparedStatement ps , ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



}
