package com.vegetable;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ContactDAOImpl implements ContactDAO {

	private Connection conn;
	
	public ContactDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

    // Insert Contact Details here
	public boolean addContact(ContactDtls cd) {
		boolean f = false;
		try {
			String sql = "insert into contact(name,contact,emailid,subject,message) values(?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cd.getName());
			ps.setString(2, cd.getContact());
			ps.setString(3, cd.getEmailid());
			ps.setString(4, cd.getSubject());
			ps.setString(5, cd.getMessage());					
						
			int i = ps.executeUpdate();
				
			if (i == 1) {
				f = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return f;
	}
}