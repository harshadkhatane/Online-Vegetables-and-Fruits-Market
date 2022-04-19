package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/RejectOrder")
public class RejectOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderid=req.getParameter("oid");
        String reason=req.getParameter("reason");
        try{
            Connection con=DbConnect.Connect();
            PreparedStatement ps=con.prepareStatement("UPDATE orders set order_status='Cancelled',remarks=? where order_id=?");
            ps.setString(1,reason);
            ps.setString(2,orderid);
            ps.executeUpdate();
            
            resp.sendRedirect("admin/view_Booking.jsp");
        }catch(Exception ex){
        	System.out.println(ex);
            resp.getWriter().println("Error "+ex.getMessage());
        }
    }    
}