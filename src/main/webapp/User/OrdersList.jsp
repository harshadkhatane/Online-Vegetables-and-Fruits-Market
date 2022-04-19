<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vegetable.DbConnect,java.sql.*"%>
<%
    session.setAttribute("page", 3);
%>
<jsp:include flush="false" page="navbar1.jsp"/>
<jsp:include flush="false" page="allCss.jsp"/>
<script>
    $(function () {
        $("#orders").DataTable({
            'ordering': false
        });
    });
</script>
<div class="container mt-5">
<h2 class="text-center">List of Orders</h2>
<table id="orders" class="table table-striped table-sm">
    <thead class="table-dark"style="background-image: url('images/background-textures.png') ;">
        <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>User ID</th> 
            <th>Order Status</th>
            <th>Operations</th>
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = DbConnect.Connect();
            ResultSet rs = con.createStatement().executeQuery("select * from orders order by order_id desc");
            while (rs.next()) {
                String orderdate = DbConnect.formatDate(rs.getString("orderdate"));
                String status = rs.getString("order_status");
        %>
        <tr>
            <td><%= rs.getString("order_id")%></td>
            <td><%= orderdate%></td>
            <td><%= rs.getString("userid")%></td>
            <%
                String stclass = "";
                if (status.equals("Pending")) {
                    stclass = "bg-danger";
                } else if (status.equals("Confirmed")) {
                    stclass = "bg-success";
                } else {
                    stclass = "bg-primary";
                }
            %>
            <td class="font-weight-bold text-white <%= stclass%>"><%= status%></td>
            <td><a href="OrderDetails.jsp?oid=<%= rs.getString("order_id")%>" class="btn btn-sm btn-primary">Show Details</a>
               | <a href="deleteOrder.jsp?oid=<%= rs.getString("order_id")%>" class="btn btn-sm btn-danger">Delete</a></td>
        </tr>
        <%
            }
            con.close();
        %>
    </tbody>
</table>
</div>