package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeletePro")
public class DeleteProServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            String prodid = request.getParameter("prodid");
            String userid = session.getAttribute("email").toString();

            Cart c = new Cart();
            c.setProdid(prodid);
            c.setUserid(userid);

            CartDAO.removeFromCart(c);

            if (CartDAO.getCount(userid) > 0) {
                session.setAttribute("msg", "Item removed from cart..!!");
                response.sendRedirect("User/ViewCart.jsp");
            } else {
                session.setAttribute("msg", "Cart is now empty..!!");
                response.sendRedirect("User/ViewCart.jsp");
            }
        } catch (Exception ex) {
            response.getWriter().println("Error  " + ex.getMessage());
        }
    }

}
