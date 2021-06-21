package com.itstudy.util;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * 封装BasicDAOImpl
 * @param <T>
 */
public class BaseDao<T> {


    private QueryRunner queryRunner = new QueryRunner();


    /**
     *  批量执行增删改的SQL
     * @param sql
     * @param params
     * @return 批量操作中每一条SQL语句都会返回一个受影响行数，所有受影响行数组成的数组就是这个返回值
     */
    public int[] batch(String sql , Object[][] params) {
        //声明一个变量来保存受影响的行数
        int[] batch = null;

        Connection conn = null;

        try {
            //获取连接
            conn = JDBCUtil.getConnection();
            //执行批量操作
            batch = queryRunner.batch(conn, sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
            // 将当前捕获的编译时异常转换为运行时异常重新抛出
            throw new RuntimeException(e);
        }

        return batch;

    }

    /**
     * 执行增删改的sql
     *
     * @param sql                 :要执行的sql语句
     * @param params:按照顺序为占位符所赋的值
     * @return :增删改统一的结果，受影响的行数
     */
    public int update(String sql, Object... params) {
        Connection conn = null;
        int result = 0;
        //编写sql，用形参传入的方式代替
        try {
            conn = JDBCUtil.getConnection();
            result = queryRunner.update(conn, sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
            // 将当前捕获的编译时异常转换为运行时异常重新抛出
            throw new RuntimeException(e);

        }
        return result;
    }

    /**
     * 将mysql中的一条记录转换为实体类对象
     *
     * @param clazz  表所对应的实体类类型的Class对象
     * @param sql    要执行的SQL语句
     * @param params 按照顺序为占位符所赋的值
     * @return mysql中的一条记录转换的实体类对象
     * 要求：mysql中表的字段名要和实体类中的属性名保持一致
     * 若不一致，可以通过为字段设置别名的方式解决对应问题
     */
    public T getBean(Class<T> clazz, String sql, Object... params) {
        Connection conn = null;
        conn = JDBCUtil.getConnection();
        T t = null;
        try {
            t = queryRunner.query(conn, sql, new BeanHandler<T>(clazz), params);
        } catch (SQLException e) {
            e.printStackTrace();
            // 将当前捕获的编译时异常转换为运行时异常重新抛出
            throw new RuntimeException(e);

        }

        return t;
    }

    /**
     * 将mysql中的多条数据转换为实体类对象的集合
     *
     * @param clazz  表所对应的实体类类型的Class对象
     * @param sql    要执行的SQL语句
     * @param params 按照顺序为占位符所赋的值
     * @return mysql中的多条数据转换的实体类对象的集合
     * BeanListHandler：dbutils中提供将mysql中的多条记录转换为实体类对象的集合结果的处理方式
     * 要求：mysql中表的字段名要和实体类中的属性名保持一致
     * 若不一致，可以通过为字段设置别名的方式解决对应问题
     */
    public List<T> getBeanList(Class<T> clazz, String sql, Object... params) {
        Connection conn = null;
        conn = JDBCUtil.getConnection();
        List<T> list = null;
        try {
            list = queryRunner.query(conn, sql, new BeanListHandler<T>(clazz), params);
        } catch (SQLException e) {
            e.printStackTrace();
            // 将当前捕获的编译时异常转换为运行时异常重新抛出
            throw new RuntimeException(e);

        }
        return list;
    }


    /**
     * 将mysql查询的单行单列的数据转换为Object类型的结果
     *
     * @param sql    要执行的SQL语句
     * @param params 按照顺序为占位符所赋的值
     * @return mysql中的单行单列的数据转换的Object类型的结果
     * 适用场景：查询的结果必须为单行单列，例如：查询总记录数
     */
    public Object getSingleData(String sql, Object... params) {
        Connection conn = null;
        conn = JDBCUtil.getConnection();
        Object o = null;

        try {
            o = queryRunner.query(conn, sql, new ScalarHandler<>(), params);
        } catch (SQLException e) {
            e.printStackTrace();
            // 将当前捕获的编译时异常转换为运行时异常重新抛出
            throw new RuntimeException(e);

        }
        return o;
    }
}
