package com.vegetable;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PlaceOrder")
public class PlaceOrderServlet  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            
            Connection con=DbConnect.Connect();
            PreparedStatement ps=con.prepareStatement("insert into orders(userid) values(?)");
            HttpSession session=req.getSession();
            String email=session.getAttribute("email").toString();
            ps.setString(1,email);
            ps.executeUpdate();
            
            ResultSet rs=con.createStatement().executeQuery("select max(order_id) from orders");
            int order_id=1;
            if(rs.next()){
                order_id=rs.getInt(1);
            }
            
            ResultSet rs2=con.createStatement().executeQuery("select * from cart where userid='"+session.getAttribute("email")+"'");
            while(rs2.next()){
                PreparedStatement ps2=con.prepareStatement("INSERT INTO order_details values(?,?,?)");
                ps2.setInt(1, order_id);
                ps2.setInt(2, rs2.getInt("prodid"));
                ps2.setInt(3, rs2.getInt("qty"));
                ps2.executeUpdate();
            }
            
            con.createStatement().executeUpdate("delete from cart");
            
            session.setAttribute("msg", "Order Placed Successfully..!!");
            session.setAttribute("order_id", order_id);
            resp.sendRedirect("User/PrintBill.jsp");
            
        }catch(Exception ex){
             resp.getWriter().println("Error  "+ex.getMessage());
        }
    }
    
    
    
}
