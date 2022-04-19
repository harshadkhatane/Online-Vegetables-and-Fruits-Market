package com.vegetable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UpdatePro")
@MultipartConfig
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pname = req.getParameter("pname");
        String pcat = req.getParameter("pcat");
        String price = req.getParameter("price");
        float dprice =Float.parseFloat(req.getParameter("dprice"));
        String remarks = req.getParameter("remarks");
        String prodid = req.getParameter("prodid");
        String descr = req.getParameter("descr");
        String instock = req.getParameter("instock");
        String featured = req.getParameter("featured");

        try {
            if (!req.getPart("pic").getSubmittedFileName().isEmpty()) {
                Part photo = req.getPart("pic");
                ProductDAO.fileCopy(getServletContext(), photo, prodid + ".jpg");
            }
            Product p=new Product();
            p.setProdid(Integer.parseInt(prodid));
            p.setPname(pname);
            p.setPcat(pcat);
            p.setPrice(Float.parseFloat(price));
            p.setDisc_price(dprice);
            p.setRemarks(remarks);
            p.setDescr(descr);
            p.setInstock(instock);
            p.setFeatured(featured);
            
            ProductDAO.updateProduct(p);

            resp.sendRedirect("admin/editProduct.jsp?msg=valid&prodid="+prodid);

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }

    }

}
