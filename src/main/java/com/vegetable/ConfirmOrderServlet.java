package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/ConfirmOrder")
public class ConfirmOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderid=req.getParameter("oid");
        try{
            Connection con=DbConnect.Connect();
            PreparedStatement ps=con.prepareStatement("UPDATE orders set order_status='Confirmed' where order_id=?");
            ps.setString(1,orderid);
            ps.executeUpdate();
            
            resp.sendRedirect("admin/view_Booking.jsp");
        }catch(Exception ex){
            resp.getWriter().println("Error "+ex.getMessage());
        }
    }
    
}
