package com.vegetable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public static void addToCart(Cart c) throws Exception {
        Connection con = DbConnect.Connect();
        PreparedStatement ps = con.prepareStatement("INSERT INTO cart VALUES(?,?,?)");
        ps.setString(1, c.getUserid());
        ps.setString(2, c.getProdid());
        ps.setInt(3, c.getQty());
        ps.executeUpdate();
        con.close();
    }

    public static List<Cart> getList(String userid) throws Exception {
        List<Cart> list = new ArrayList<Cart>();
        Connection con = DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * from cart where userid='" + userid + "'");
        while (rs.next()) {
            Cart c = new Cart();
            c.setUserid(userid);
            c.setProdid(rs.getString("prodid"));
            c.setQty(rs.getInt("qty"));
            list.add(c);
        }
        con.close();
        return list;
    }

    public static void increaseQty(String prodid, String userid) throws Exception {
        Connection con = DbConnect.Connect();
        PreparedStatement ps = con.prepareStatement("UPDATE cart SET qty=qty+1 where prodid=? and userid=?");
        ps.setString(1, prodid);
        ps.setString(2, userid);
        ps.executeUpdate();
        con.close();
    }

    public static void reduceQty(String prodid, String userid) throws Exception {
        Connection con = DbConnect.Connect();
        PreparedStatement ps = con.prepareStatement("UPDATE cart SET qty=qty-1 where prodid=? and userid=?");
        ps.setString(1, prodid);
        ps.setString(2, userid);
        ps.executeUpdate();
        con.close();
    }

    public static void removeFromCart(Cart c) throws Exception {
        Connection con = DbConnect.Connect();
        PreparedStatement ps = con.prepareStatement("DELETE FROM cart where prodid=? and userid=?");
        ps.setString(1, c.getProdid());
        ps.setString(2, c.getUserid());
        ps.executeUpdate();
        con.close();
    }

    public static int getCount(String userid) throws Exception {
        Connection con = DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT sum(qty) from cart where userid='" + userid + "'");
        rs.next();
        int count = rs.getInt(1);
        con.close();
        return count;
    }

    public static boolean checkItem(String prodid, String userid) throws Exception {
        Connection con = DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * from cart where prodid=" + prodid + " and userid='" + userid + "'");
        boolean available = false;
        if (rs.next()) {
            available = true;
        } else {
            available = false;
        }
        con.close();
        return available;
    }

}
