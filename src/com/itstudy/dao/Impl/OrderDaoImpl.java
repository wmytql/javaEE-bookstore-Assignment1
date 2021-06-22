package com.itstudy.dao.Impl;

import com.itstudy.bean.Order;
import com.itstudy.dao.OrderDao;
import com.itstudy.util.BaseDao;
import com.itstudy.util.JDBCUtil;

import java.sql.*;

public class OrderDaoImpl extends BaseDao<Order> implements OrderDao {

    @Override
    public int addOrder(Order order) {
        // 声明一个变量用来保存受影响行数
        int rowNumber = 0;

        // 获取数据库连接
        Connection conn = JDBCUtil.getConnection();

        // 声明PreparedStatement变量
        PreparedStatement ps = null;

        // 声明ResultSet变量
        ResultSet rs = null;

        //编写sql
        String sql = "insert into bs_order(order_sequence,create_time,total_count,total_amount,order_status,user_id) values(?,?,?,?,?,?)";

        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,order.getOrderSequence());
            ps.setString(2,order.getCreateTime());
            ps.setInt(3,order.getTotalCount());
            ps.setDouble(4,order.getTotalAmount());
            ps.setInt(5,order.getOrderStatus());
            ps.setInt(6,order.getUserId());

            //执行sql
            rowNumber = ps.executeUpdate();
            //获取自增的主键
            rs = ps.getGeneratedKeys();

            //解析结果集
            rs.next();
            int orderId = rs.getInt(1);

            //将自增的主键设置到order类中
            order.setOrderId(orderId);

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
        return rowNumber;

    }
}
