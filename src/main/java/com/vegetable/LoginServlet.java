package com.vegetable;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		
		UsersDAO dao = new UsersDAO(DbConnect.Connect());
		UsersDtls u = dao.loginUser(email, pass);
		
		HttpSession session = req.getSession();
		if(u!=null) {
			session.setAttribute("email", email);
			session.setAttribute("userId", u.getUid());
			session.setAttribute("validMsg", "Logged in Successfully...");
			resp.sendRedirect("login.jsp");
			
		}
		else {
			session.setAttribute("invalidMsg", "Username & Password Does Not Match..");
			resp.sendRedirect("login.jsp");
			
		}
	}
}