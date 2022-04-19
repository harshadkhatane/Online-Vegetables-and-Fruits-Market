package com.vegetable;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String username = req.getParameter("firstname");
       String contact = req.getParameter("contact");
       String email = req.getParameter("email");
       String address = req.getParameter("address");
       String description = req.getParameter("description");
       String feedbackDate = req.getParameter("feedbackDate");
		
		Feedback f = new Feedback(username,contact,email,address,description,feedbackDate);
		FeedbackDAO dao = new FeedbackDAO(DbConnect.Connect());
		
		boolean b = dao.addFeedback(f);
		
		HttpSession session = req.getSession();
		if(b) {
			session.setAttribute("successMsg", "Your Feedback has been send Successfully..");
			resp.sendRedirect("User/sendFeedback.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something went Wrong..!!");
			resp.sendRedirect("User/sendFeedback.jsp");
		}	
	}	
}