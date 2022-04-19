package com.vegetable;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderDAO {

    public static double getTotalSales() throws Exception {
        Connection con = DbConnect.Connect();
        Statement st = con.createStatement();
        String sql = "select sum(amount) from orderview where year(orderdate)=year(now())";
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        double res = rs.getDouble(1);
        con.close();
        return res;
    }

    public static double getCurrentMonthSales() throws Exception {
        Connection con = DbConnect.Connect();
        Statement st = con.createStatement();
        String sql = "select sum(amount) from orderview where year(orderdate)=year(now()) and month(orderdate)=month(now())";
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        double res = rs.getDouble(1);
        con.close();
        return res;
    }

    public static double getCurrentWeekSales() throws Exception {
        Connection con = DbConnect.Connect();
        Statement st = con.createStatement();
        String sql = "select sum(amount) from orderview where year(orderdate)=year(now()) and month(orderdate)=month(now()) and week(orderdate)=week(now())";
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        double res = rs.getDouble(1);
        con.close();
        return res;
    }

    public static double getTodaySales() throws Exception {
        Connection con = DbConnect.Connect();
        Statement st = con.createStatement();
        String sql = "select sum(amount) from orderview where year(orderdate)=year(now()) and month(orderdate)=month(now()) and day(orderdate)=day(now())";
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        double res = rs.getDouble(1);
        con.close();
        return res;
    }

    public static List<OrderModel> getOrders() throws Exception {
        List<OrderModel> list = new ArrayList<OrderModel>();
        Connection con = DbConnect.Connect();
        Statement st = con.createStatement();
        String sql = "select * from orderview";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            OrderModel om = new OrderModel();
            om.setOrder_id(rs.getInt(1));
            om.setOrderdate(rs.getString(2));
            om.setPname(rs.getString(3));
            om.setPrice(rs.getFloat(4));
            om.setQty(rs.getInt(5));
            om.setAmount(rs.getFloat(6));
            list.add(om);
        }
        con.close();
        return list;
    }

    public static List<Map<Object, Object>> getMonthlySales() throws Exception {
        List<Map<Object, Object>> list = new ArrayList<Map<Object,Object>>();
        Connection con = DbConnect.Connect();
        Statement st = con.createStatement();
        String sql = "select monthname(orderdate),sum(amount) from orderview group by month(orderdate)";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            Map<Object, Object> map = new HashMap<Object, Object>();
            map.put("label", rs.getString(1));
            map.put("y", rs.getFloat(2));
            list.add(map);
        }
        con.close();
        return list;
    }

    public static List<Map<Object, Object>> getThisWeekSales() throws Exception {
        List<Map<Object, Object>> list = new ArrayList<Map<Object,Object>>();
        Connection con = DbConnect.Connect();
        Statement st = con.createStatement();
        String sql = "select dayname(orderdate),sum(amount) from orderview "
                + "where month(orderdate)=month(now()) and week(orderdate)=week(now())group by day(orderdate)";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            Map<Object, Object> map = new HashMap<Object, Object>();
            map.put("label", rs.getString(1));
            map.put("y", rs.getFloat(2));
            list.add(map);
        }
        con.close();
        return list;
    }

    public static void cancelOrder(String orderid) throws Exception {
        Connection con = DbConnect.Connect();
        PreparedStatement ps = con.prepareStatement("delete from orders where order_id=?");
        ps.setString(1, orderid);
        ps.executeUpdate();

        ps = con.prepareStatement("delete from order_details where order_id=?");
        ps.setString(1, orderid);
        ps.executeUpdate();
        con.close();
    }
}
