<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*"%>

<%
	int uid = Integer.parseInt(request.getParameter("uid"));
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		st.executeUpdate("delete from users where uid="+uid+"");
		response.sendRedirect("view_User.jsp?msg=deleted");
	} catch (Exception e) {
		System.out.println(e);
	}
%>