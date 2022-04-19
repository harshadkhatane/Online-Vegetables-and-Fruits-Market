<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*"%>
<jsp:include flush="true" page="navbar1.jsp"/>
<%@include file="allCss.jsp" %>
<style>
    @media print{
        .header,.h_menu,.footer,.btn{
            display: none !important;
        }
    }
</style>
<button onclick="print()" class="btn btn-secondary btn-sm float-right m-2">Print Bill</button>
<div class="text-center mt-5">
    <h3>Online Vegetables and Fruits Market</h3>
    <h4>40/8147, C II Floor, Narakathara Road</h4>
    <h4 class="border-bottom border-dark pb-2">Narakathara Road, Ernakulam, Kerala 682035 (India)</h4>
    <h4>Invoice no. <%= session.getAttribute("order_id")%> </h4>
</div>
<%
    Connection con = DbConnect.Connect();
    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM order_details inner join products on products.prodid=order_details.prodid where order_id="
            + session.getAttribute("order_id"));
    ResultSet rs2 = con.createStatement().executeQuery("SELECT userid,order_status from orders "
            + "where order_id=" + session.getAttribute("order_id"));
    rs2.next();
    ResultSet rs3=con.createStatement()
            .executeQuery("SELECT * from cust_address where userid='"+rs2.getString(1)+"'");
    rs3.next();
%>
<div class="container mt-1">
<div class="row">
    <div class="offset-7 col-sm-5">
    <table class="table table-sm table-borderless">
    <tr>
        <th>Customer Name</th>
        <th class="text-right font-weight-bold"><%= rs3.getString("name") %></th>
    </tr>
    <tr>
        <th>Address</th>
        <th class="text-right">
            <%= rs3.getString("address") %><br>            
            <%= rs3.getString("city") %>,<%= rs3.getString("state") %><br>
            Pin code-<%= rs3.getString("pin") %><br>
        </th>
    </tr>
</table>
        
    </div>
</div>

<table class="table table-bordered table-striped table-sm">
    <thead class="font-weight-bold table-primary">
        <tr>
            <th>Sr. No.</th>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Amount</th>                    
        </tr>
    </thead>
    <tbody>
        <%
            int counter = 1, total = 0;
            while (rs.next()) {
        %>
        <tr>
            <td><%= counter%></td>  
            <td><%= rs.getString("pname")%></td>   
            <td>&#8377; <%= rs.getString("disc_price")%></td> 
            <td><%= rs.getString("qty")%></td>  
            <td>&#8377; <%= rs.getInt("qty") * rs.getInt("disc_price")%></td>  

        </tr>
        <%
                counter++;
                total += rs.getInt("qty") * rs.getInt("disc_price");
            }
            con.close();
        %>
    </tbody>
    <tfoot class="font-weight-bold">
        <tr>
            <th colspan="4" class="text-right">Total Bill Amount</th>
            <th>&#8377; <%= total%></th>
        </tr>
        <tr>
            <th colspan="4" class="text-right">GST @ 15%</th>
            <th>&#8377; <%= total*0.15 %></th>
        </tr>
        <tr>
            <th colspan="4" class="text-right">Net Bill Amount</th>
            <th>&#8377; <%= total+total*0.15 %></th>
        </tr>
    </tfoot>
</table>
</div>