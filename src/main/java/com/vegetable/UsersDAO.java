package com.vegetable;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;


public class UsersDAO {
	private Connection con;
	
	public UsersDAO(Connection con) {
		super();
		this.con = con;
	}
   // Insert User Details
	public static void addUsers(UsersDtls u, Part part, ServletContext ctx) throws Exception {
	       Connection con = DbConnect.Connect();
	        PreparedStatement ps = con
	                .prepareStatement("INSERT into users(firstname,lastname,password,email,contact,city,address) VALUES(?,?,?,?,?,?,?)",
	                        Statement.RETURN_GENERATED_KEYS);
	        ps.setString(1, u.getFirstname());
	        ps.setString(2, u.getLastname());
	        ps.setString(3, u.getPassword());
	        ps.setString(4, u.getEmail());
	        ps.setString(5, u.getContact());
	        ps.setString(6, u.getCity());
	        ps.setString(7, u.getAddress());
	        
	        ps.executeUpdate();
	        ResultSet rs = ps.getGeneratedKeys();
	        rs.next();
	        
	        String id = rs.getString(1);
	        ps = con.prepareStatement("update users set img=? where uid=?");
	        ps.setString(1, id + ".jpg");
	        ps.setString(2, id);
	        ps.executeUpdate();
	        fileCopy(ctx, part, id + ".jpg");
	        con.close();
	        System.out.println("All done with service");
	    }
	
	 public static void fileCopy(ServletContext ctx, Part part, String filename) throws Exception {
	        Files.copy(part.getInputStream(),
	                Paths.get(ctx.getRealPath("/images1/"), filename),
	                StandardCopyOption.REPLACE_EXISTING);
	    }
	 
	 public static List<UsersDtls> getUsers(boolean sort, boolean desc) throws Exception {
	        List<UsersDtls> list = new ArrayList<UsersDtls>();
	        Connection con = DbConnect.Connect();
	        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM users order by uid");
	         while (rs.next()) {
	        	 UsersDtls s = new UsersDtls();
	            s.setUid(rs.getInt("uid"));
	            s.setFirstname(rs.getString("firstname"));
	            s.setLastname(rs.getString("Lastname"));
	            s.setPassword(rs.getString("password"));
	            s.setEmail(rs.getString("email"));
	            s.setContact(rs.getString("contact"));
	            s.setCity(rs.getString("city"));
	            s.setAddress(rs.getString("address"));
	            s.setImg(rs.getString("img"));
	            list.add(s);
	        }
	        con.close();
	        return list;
	    }
	 
	 //User Login 	 
	 public UsersDtls loginUser(String u, String p) {
		 UsersDtls ud = null;
			try {
				String sql = "select * from users where email=? and password=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, u);
				ps.setString(2, p);
				
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					ud = new UsersDtls();
					ud.setUid(rs.getInt(1));
					ud.setFirstname(rs.getString(2));
					ud.setLastname(rs.getString(3));
					ud.setPassword(rs.getString(4));
					ud.setEmail(rs.getString(5));
					ud.setContact(rs.getString(6));
					ud.setCity(rs.getString(7));					
					ud.setAddress(rs.getString(8));					
					ud.setImg(rs.getString(9));
					
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return ud;
	 }
	 
	 //Admin Login
	 public UsersDtls loginAdmin(String e, String p) {
		 UsersDtls ud = null;
			try {
				String sql = "select * from admin where username=? and password=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, e);
				ps.setString(2, p);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					ud = new UsersDtls();
					ud.setEmail(rs.getString(1));
					ud.setPassword(rs.getString(2));
					
				}
			} catch (Exception ex) {
				ex.printStackTrace();				
			}
			return ud;
	 }
	 
	 // Edit Feedback
	 public UsersDtls getUserById(int uid) {
		 UsersDtls u = null;
			try {
				String sql="select * from users where uid=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, uid);
				
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					u=new UsersDtls();
					u.setUid(rs.getInt(1));
					u.setFirstname(rs.getString(2));
					u.setLastname(rs.getString(3));
					u.setEmail(rs.getString(5));
					u.setContact(rs.getString(6));
					u.setCity(rs.getString(7));
					u.setAddress(rs.getString(8));
					u.setImg(rs.getString(9));
																		
				}
			} catch (Exception e) {
				e.printStackTrace();
			}		 
		 return u;
	 }
	 
	    //update user
	    public static void updateUsers(UsersDtls u) throws Exception {
	        Connection con = DbConnect.Connect();

	        PreparedStatement ps = con
	                .prepareStatement("UPDATE users set firstname=?,lastname=?,email=?,contact=?,city=?,address=? where uid=?");
	        ps.setString(1, u.getFirstname());
	        ps.setString(2, u.getLastname());
	        ps.setString(3, u.getEmail());
	        ps.setString(4, u.getContact());
	        ps.setString(5, u.getCity());
	        ps.setString(6, u.getAddress());
	        ps.setInt(7, u.getUid());

	        ps.executeUpdate();
	        con.close();
	        System.out.println("Users Updated..!!");
	    }
	    
	  //update Image
	    public static void updateImage(UsersDtls u) throws Exception {
	        Connection con = DbConnect.Connect();
	        
	        PreparedStatement ps = con
	                .prepareStatement("UPDATE users set img=? where uid=?");
	        
	        ps.setString(1, u.getImg());
	        ps.setInt(2, u.getUid());
	        ps.executeUpdate();
	       
	        System.out.println("Users Updated..!!");
	    }
}