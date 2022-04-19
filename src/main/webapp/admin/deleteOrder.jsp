<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*"%>

<%
	int oid = Integer.parseInt(request.getParameter("oid"));
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		st.executeUpdate("delete from orders where order_id="+oid+"");
		response.sendRedirect("view_Booking.jsp?msg=deleted");
	} catch (Exception e) {
		System.out.println(e);
	}
%>