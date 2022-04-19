package com.vegetable;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class DbConnect {
	private static Connection con;
	  public static Connection Connect()
	  {
		   try{
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vegetableshopjsp","root","root");
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   return con;
	  }		  
	  
	  public static int getCount(String table) throws Exception {
	        Connection con = Connect();
	        ResultSet rs = con.createStatement().executeQuery("select count(*) from " + table);
	        rs.next();
	        return rs.getInt(1);
	    }

	    public static String getName(String email) throws Exception {
	        Connection con = Connect();
	        ResultSet rs = con.createStatement().executeQuery("select * from users where email='"+email+"'");
	        rs.next();
	        return rs.getString(2) + " " + rs.getString(3);
	    }

	    public static List<String> getCategory() throws Exception {
	        List<String> list = new ArrayList<String>();
	        Connection con = Connect();
	        ResultSet rs = con.createStatement().executeQuery("select catname from category");
	        while (rs.next()) {
	            list.add(rs.getString(1));
	        }
	        return list;
	    }

	    public static String formatDate(String date) throws Exception {
	        SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
	        SimpleDateFormat src = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	        java.util.Date od = src.parse(date);
	        return sdf.format(od);
	    }	  
}