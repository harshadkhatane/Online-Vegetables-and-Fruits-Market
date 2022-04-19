package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Upload")
@MultipartConfig
public class ProductUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pname = req.getParameter("pname");
        String pcat = req.getParameter("pcat");
        float price = Float.parseFloat(req.getParameter("price"));
        float dprice =Float.parseFloat(req.getParameter("dprice"));
        String remarks = req.getParameter("remarks");
        String descr = req.getParameter("descr");
        Part photo = req.getPart("pic");
       
        try {
            Product p=new Product(pname, pcat, price, dprice, remarks, descr);
            ProductDAO.addProduct(p, photo,getServletContext());
            resp.sendRedirect("admin/addProduct.jsp?msg=valid");

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
    }
}