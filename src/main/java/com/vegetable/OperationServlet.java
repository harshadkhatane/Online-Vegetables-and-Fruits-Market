package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Operation")
public class OperationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String prodid = req.getParameter("prodid");
        int qty = Integer.parseInt(req.getParameter("qty"));
        HttpSession session = req.getSession();
        if (session.getAttribute("email") == null) {
            session.setAttribute("msg", "Please login or register first..!!");
            resp.sendRedirect("login.jsp");
        } else {
            String userid = session.getAttribute("email").toString();
            String referer=req.getHeader("Referer");
            System.out.println(referer);
            try {                
                if(CartDAO.checkItem(prodid, userid)){
                    session.setAttribute("msg", "Item already added to cart");
                    //resp.sendRedirect("index.jsp");
                    resp.sendRedirect(referer);
                }
                Cart c=new Cart();
                c.setProdid(prodid);
                c.setUserid(userid);
                c.setQty(qty);
                CartDAO.addToCart(c);                

                if(req.getParameter("buy")!=null){
                    resp.sendRedirect("User/ViewCart.jsp");
                }else{
                    session.setAttribute("msg", "Product Added Successfully");
                    //resp.sendRedirect("index.jsp");
                    resp.sendRedirect(referer);
                }

            } 
            catch (Exception e) {
                resp.getWriter().println("Error "+e.getMessage());
            }
        }
    }

}
