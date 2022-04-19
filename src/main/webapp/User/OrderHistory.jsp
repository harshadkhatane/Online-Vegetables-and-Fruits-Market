<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<jsp:include flush="true" page="navbar1.jsp"/>
<%@include file="allCss.jsp" %>
<%
    if (session.getAttribute("msg") != null) {
%>
<div class="row">
    <div class="col-sm-5 mx-auto">
        <div class="alert alert-success text-center p-1 my-1">
            <strong><%= session.getAttribute("msg")%></strong>
        </div>
    </div>
</div>
<%
        session.removeAttribute("msg");        
    }
%>
<div class="container mt-5">
<h4 class="p-2 text-center border border-dark mt-2">Customer Order History</h4>
<table class="table table-bordered table-striped table-sm">
    <thead class="table-dark">
    <tr>
        <th>Order ID</th>
        <th>Order Date</th>        
        <th>Status</th>
        <th>Show Details</th>
    </tr>
    </thead>
    <tbody>
    <%
        Connection con = DbConnect.Connect();
        ResultSet rs = con.createStatement().executeQuery("select * from orders where userid='"+session.getAttribute("email")+"' order by orderdate desc");
        while (rs.next()) {
            String orderdate=DbConnect.formatDate(rs.getString("orderdate"));
    %>
    <tr>
        <td><%= rs.getString("order_id")%></td>
        <td><%= orderdate %></td>  
        <td><%= rs.getString("order_status") %></td>  
        <td><a href="COrderDetails.jsp?oid=<%= rs.getString("order_id")%>" class="btn btn-sm btn-primary">Show Details</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>