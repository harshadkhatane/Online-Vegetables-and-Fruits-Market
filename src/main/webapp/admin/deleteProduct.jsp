<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*"%>

<%
	int prodid = Integer.parseInt(request.getParameter("prodid"));
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		st.executeUpdate("delete from products where prodid="+prodid+"");
		response.sendRedirect("viewProduct.jsp?msg=deleted");
	} catch (Exception e) {
		System.out.println(e);
	}
%>