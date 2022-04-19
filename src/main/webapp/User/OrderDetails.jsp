<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,com.vegetable.DbConnect" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="navbar1.jsp"/>
<jsp:include flush="true" page="allCss.jsp"/>
<h4 class="text-center mb-2 border-bottom text-white p-2 bg-dark">Order Details of No. <%= request.getParameter("oid")%></h4>
<%
    Connection con = DbConnect.Connect();
    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM order_details inner join products on products.prodid=order_details.prodid where order_id=" + request.getParameter("oid"));
    ResultSet rs2 = con.createStatement().executeQuery("SELECT userid,orderdate,remarks from orders where order_id=" + request.getParameter("oid"));
    rs2.next();
    String remarks=rs2.getString("remarks")==null ? "" : rs2.getString("remarks");
    ResultSet rs3 = con.createStatement().executeQuery("SELECT * from cust_address where userid='" + rs2.getString(1) + "'");
    rs3.next();
    String orderdate = DbConnect.formatDate(rs2.getString("orderdate"));
%>
<h5 class="text-center">Delivery Address</h5>
<fieldset>
    <table class="table table-bordered table-primary table-striped table-sm">
        <tr>
            <td>Customer Name : </td>
            <th><%= DbConnect.getName(rs2.getString(1))%></th>
            <td>Order Date : </td>
            <th><%= orderdate%></th></tr>

        <tr>
            <td>Name : </td>
            <th><%= rs3.getString("name")%></th>
            <td>Mobile : </td>
            <th>+91 <%= rs3.getString("mobile")%></th></tr>

        <tr>
            <td>State : </td>
            <td><%= rs3.getString("state")%></td>
            <td>City : </td>
            <td><%= rs3.getString("city")%></td></tr>

        <tr>
            <td>Locality : </td>
            <td><%= rs3.getString("locality")%></td>
            <td>Pin : </td>
            <td><%= rs3.getString("pin")%></td></tr>

        <tr>
            <td>Address : </td>
            <td><%= rs3.getString("address")%></td>
            <td>Address Type:</td>
            <td><%= rs3.getString("adtype")%></td></tr>

    </table>

</fieldset>
<table class="table table-bordered table-striped table-sm">
    <thead class="table-dark">
    <th>Sr. No.</th>
    <th>Product Name</th>
    <th>Photo</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Amount</th>                    
</thead>
<tbody>
    <%
        int counter = 1, total = 0;
        while (rs.next()) {
    %>
    <tr>
        <td><%= counter%></td>  
        <td><%= rs.getString("pname")%></td>  
        <td><img src='../images/<%= rs.getString("photo")%>' width="50" height="30"></td>  
        <td>&#8377; <%= rs.getString("disc_price")%></td> 
        <td><%= rs.getString("qty")%></td>  
        <td>&#8377; <%= rs.getInt("qty") * rs.getInt("disc_price")%></td>  

    </tr>
    <%
            counter++;
            total += rs.getInt("qty") * rs.getInt("disc_price");
        }
    %>
</tbody>
<tfoot class="table-dark">
    <tr>
        <th colspan="5">Total Bill Amount</th>
        <th>&#8377; <%= total%></th>
    </tr>
</tfoot>
</table>
<% if(rs2.getString("remarks")==null){ %>
<div class="row">
    <div class="col-sm-10">
        <form action="RejectOrder">
            <div class="input-group">
                <input type="hidden" name="oid" value="${param.oid}" />
                <input type="text" name="reason" placeholder="Reason for Cancel" class="form-control">
                <div class="input-group-append">
                    <button class="btn btn-danger float-right mb-3">Cancel Order</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-sm-2">
        <a class="btn btn-primary" href="ConfirmOrder?oid=<%= request.getParameter("oid")%>">Confirm Order</a>
    </div>
</div>
<% }  else { %>
<h4 class="bg-red text-center p-2">Order Cancelled : <%= remarks %></h4>
<% } %>
