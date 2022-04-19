<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*"%>

<%
	int fid = Integer.parseInt(request.getParameter("fid"));
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		st.executeUpdate("delete from feedback where fid="+fid+"");
		response.sendRedirect("view_Feedback.jsp?msg=deleted");
	} catch (Exception e) {
		System.out.println(e);
	}
%>