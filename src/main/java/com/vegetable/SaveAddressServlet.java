package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet("/SaveAddress")
public class SaveAddressServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String userid = session.getAttribute("email").toString();
            Connection con = DbConnect.Connect();
            ResultSet rs = con.createStatement().executeQuery("select * from cust_address where userid='" + userid + "'");
            if (!rs.next()) {
                String name = req.getParameter("cname");
                String mobile = req.getParameter("mobile");
                String pin = req.getParameter("pin");
                String locality = req.getParameter("locality");
                String state = req.getParameter("state");
                String city = req.getParameter("city");
                String address = req.getParameter("address");
                String adtype = req.getParameter("adtype");

                PreparedStatement ps = con.prepareStatement("insert into cust_address values(?,?,?,?,?,?,?,?,?)");

                ps.setString(1, userid);
                ps.setString(2, name);
                ps.setString(3, mobile);
                ps.setString(4, pin);
                ps.setString(5, locality);
                ps.setString(6, state);
                ps.setString(7, city);
                ps.setString(8, address);
                ps.setString(9, adtype);

                ps.executeUpdate();
                con.close();
            }
            resp.sendRedirect("PlaceOrder");
        } catch (Exception ex) {
            resp.getWriter().println("Error " + ex.getMessage());
        }

    }

}
