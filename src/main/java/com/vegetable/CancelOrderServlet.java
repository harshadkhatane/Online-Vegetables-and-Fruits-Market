package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CancelOrder")
public class CancelOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            String orderid=req.getParameter("oid");
            OrderDAO.cancelOrder(orderid);
            HttpSession session=req.getSession();
            session.setAttribute("msg", "Order Cancelled Successfully..!!");
            
            resp.sendRedirect("User/OrderHistory.jsp");
        } catch (Exception e) {
            resp.getWriter().println("Error "+e.getMessage());
        }
    }
    
}
