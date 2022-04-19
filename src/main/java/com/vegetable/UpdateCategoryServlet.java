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
import javax.servlet.http.Part;



@WebServlet("/UpdateCat")
public class UpdateCategoryServlet extends HttpServlet {
	
	   Connection con;
	   Statement st;
	   PrintWriter out;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 int result = 0;
	       int catid=Integer.parseInt(req.getParameter("catid"));
		   try 
		   {
			  con= DbConnect.Connect(); 
			
		    String catname = req.getParameter("catname");
			  			  			
			PreparedStatement ps = con.prepareStatement("update category set catname=? where catid=?");
			  			
			ps.setString(1, catname);
			ps.setInt(2, catid);
			result=ps.executeUpdate();
			
			if(result>0) {
				resp.sendRedirect("admin/editCategory.jsp?msg=successMsg&catid="+catid);
			}
		   } 
		   catch (Exception e) 
		   {
			   System.out.print(e);
			 resp.sendRedirect("admin/editCategory.jsp?msg=errorMsg&catid="+catid);
		   }
		
	}	
}