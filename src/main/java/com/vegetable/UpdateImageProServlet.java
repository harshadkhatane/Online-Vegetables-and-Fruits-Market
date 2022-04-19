package com.vegetable;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/editImage")
@MultipartConfig
public class UpdateImageProServlet extends HttpServlet {
	Connection con;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = 0;
		int uid = Integer.parseInt(req.getParameter("uid"));
		try {

			con = DbConnect.Connect();

			Part img = req.getPart("pic");
			UsersDAO.fileCopy(getServletContext(), img, uid + ".jpg");
			PreparedStatement ps = con.prepareStatement("update users set img=? where uid=?");

			ps.setString(1, uid + ".jpg");
			ps.setInt(2, uid);

			result = ps.executeUpdate();

			if (result > 0) {
				resp.sendRedirect("User/updateImage.jsp?msg=successMsg&uid=" + uid);
			}
		} catch (Exception e) {
			// System.out.println(e);
			resp.sendRedirect("User/updateImage.jsp?msg=errorMsg&uid=" + uid);
		}
	}
}