package com.vegetable;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CategoryDAO {
    private Connection con;
	
	public CategoryDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean addCategories(Category c) {
		boolean f=false;
		try {
			String sql="INSERT INTO category(catname) VALUES(?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, c.getCatname());	     
		    						
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	 public static List<Category> getCategories(boolean sort, boolean desc) throws Exception {
	        List<Category> list = new ArrayList<Category>();
	        Connection con = DbConnect.Connect();
	        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM category");
	         while (rs.next()) {
	        	 Category s = new Category();
	            s.setCatid(rs.getInt("catid"));
	            s.setCatname(rs.getString("catname"));
	            
	            list.add(s);
	        }
	        con.close();
	        return list;
	    }
	 
	 
	    //Edit Category
	    public Category getCategoryById(int catid) {
	    	Category c = null;
			
			try {
				String sql="select * from category where catid=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, catid);
				
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					c=new Category();
					c.setCatid(rs.getInt(1));
					c.setCatname(rs.getString(2));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return c;
		}
	 
}
