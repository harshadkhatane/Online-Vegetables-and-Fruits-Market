package com.vegetable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
	
	private Connection con;

	public FeedbackDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addFeedback(Feedback f) {
		boolean b=false;
		try {
			String sql="INSERT INTO feedback(username,contact,email,address,description) VALUES(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, f.getUsername());	
			ps.setString(2, f.getContact());	
			ps.setString(3, f.getEmail());	
			ps.setString(4, f.getAddress());	
			ps.setString(5, f.getDescription());	
		    						
			int i=ps.executeUpdate();
			
			if(i==1) {
				b=true;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	public static List<Feedback> getFeedbacks(boolean sort, boolean desc) throws Exception {
        List<Feedback> list = new ArrayList<Feedback>();
        Connection con = DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM feedback");
         while (rs.next()) {
        	 Feedback f = new Feedback();
            
        	f.setFid(rs.getInt("fid"));
            f.setUsername(rs.getString("username"));
            f.setContact(rs.getString("contact"));
            f.setEmail(rs.getString("email"));
            f.setAddress(rs.getString("address"));
            f.setDescription(rs.getString("description"));
            f.setFeedbackDate(rs.getString("feedbackDate"));
            
            list.add(f);
        }
        con.close();
        return list;
    }
}
