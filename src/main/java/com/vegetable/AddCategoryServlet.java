package com.vegetable;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/category")
public class AddCategoryServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String catname = req.getParameter("catname");
		
		Category c = new Category(catname);
		CategoryDAO dao = new CategoryDAO(DbConnect.Connect());
		
		boolean f = dao.addCategories(c);
		
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("successMsg", "New Category Add Successfully..");
			resp.sendRedirect("admin/addCategory.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something went Wrong..!!");
			resp.sendRedirect("admin/addCategory.jsp");
		}	
	}
}