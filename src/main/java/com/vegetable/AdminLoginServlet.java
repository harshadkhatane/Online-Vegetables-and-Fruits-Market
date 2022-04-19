package com.vegetable;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("username");
		String pass = req.getParameter("password");
				
		UsersDAO dao = new UsersDAO(DbConnect.Connect());
		UsersDtls u = dao.loginAdmin(email, pass);
		
		HttpSession session = req.getSession();
		
		if(u!=null) {
			session.setAttribute("username", email);
			session.setAttribute("validMsgg", "Logged in Successfully");
			resp.sendRedirect("adminlogin.jsp");			
		}
		else {
			session.setAttribute("invalidMsgg", "Invalid Creadential !! Please Try Again..");
			resp.sendRedirect("adminlogin.jsp");			
		}
	}	
}