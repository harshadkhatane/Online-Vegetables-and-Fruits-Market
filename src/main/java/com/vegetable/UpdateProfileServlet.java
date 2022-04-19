package com.vegetable;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProfile")
public class UpdateProfileServlet extends HttpServlet {

	   Connection con;
	   Statement st;
	   PrintWriter out;
	   
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 int result = 0;
	       int uid=Integer.parseInt(req.getParameter("uid"));
		   try 
		   {
			   
			  con= DbConnect.Connect(); 
			
			String firstname = req.getParameter("firstname"); 
			String lastname = req.getParameter("lastname");
			String email = req.getParameter("email");
			String contact = req.getParameter("contact");
			String city = req.getParameter("city");
			String address = req.getParameter("address");
			  			  			
			PreparedStatement ps = con.prepareStatement("update users set firstname=?, lastname=?, contact=?, email=?, address=? where uid=?");
			  			
			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ps.setString(3, contact);
			ps.setString(4, email);
			ps.setString(5, address);
			ps.setInt(6, uid);
			result=ps.executeUpdate();
			
			if(result>0) {
				resp.sendRedirect("User/profile.jsp?msg=successMsg&uid="+uid);
			}
		   } 
		   catch (Exception e) 
		   {
			 //System.out.println(e);
			 resp.sendRedirect("User/profile.jsp?msg=errorMsg&uid="+uid);
		   }
	}

}
