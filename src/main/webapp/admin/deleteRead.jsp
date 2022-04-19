<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*"%>
<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		st.executeUpdate("delete from contact where cid="+cid+"");
		response.sendRedirect("readQueries.jsp?msg=deleted");
	} catch (Exception e) {
		System.out.println(e);
	}
%>
