package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangeQty")
public class ChangeQty extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            HttpSession session = req.getSession();
            String userid = session.getAttribute("email").toString();
            
            String op=req.getParameter("op");
            String prodid=req.getParameter("prodid");
            if (req.getParameter("op").equals("add")) {                
                CartDAO.increaseQty(prodid, userid);
            } else {
                CartDAO.reduceQty(prodid, userid);
            }
            resp.sendRedirect("User/ViewCart.jsp");
        } catch (Exception ex) {
            resp.getWriter().println("Erorr " + ex.getMessage());
        }
    }

}
