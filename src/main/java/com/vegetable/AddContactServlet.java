package com.vegetable;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/contact")
public class AddContactServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String contact = req.getParameter("contact");
		String emailid = req.getParameter("emailid");
		String subject = req.getParameter("subject");
		String message = req.getParameter("message");
		String msgDate = req.getParameter("msgDate");
		String isRead = req.getParameter("isRead");
		String password = req.getParameter("password");
		
		
		ContactDtls cd = new ContactDtls(name,contact,emailid,subject,message,msgDate,isRead,password);
		ContactDAOImpl dao = new ContactDAOImpl(DbConnect.Connect());
		
		boolean f = dao.addContact(cd);
		
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("successMsg", "Your Message Has Been Send.");
			resp.sendRedirect("contact.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something went Wrong..!!");
			resp.sendRedirect("contact.jsp");
		}	
	}

}
