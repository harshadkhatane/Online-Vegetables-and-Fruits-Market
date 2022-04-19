<%@page import="com.vegetable.DbConnect"%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="navbar1.jsp" />
<%@include file="allCss.jsp" %>
<%
    String cname="",mobile="",state="",city="",locality="",address="",pincode="";
    Connection con2 = DbConnect.Connect();
    Statement st = con2.createStatement();    
    ResultSet rs = st.executeQuery("SELECT * FROM cust_address where userid='"+session.getAttribute("email")+"'");
    if(rs.next()){
        cname=rs.getString("name");
        mobile=rs.getString("mobile");
        state=rs.getString("state");
        city=rs.getString("city");
        locality=rs.getString("locality");
        pincode=rs.getString("pin");
        address=rs.getString("address");    
%>
<% } %>



<div class="container mt-5"> 
<button class="btn btn-primary mt-5 btn-sm float-right" onclick="document.getElementById('address').removeAttribute('disabled')">Change Address</button>
<h4 class="mt-2">Delivery Address</h4>
<div class="clearfix"></div>
<form method="post" action="../SaveAddress">     
    <fieldset id="address" <%= cname.equals("") ? "": "disabled" %>>
   
    <div class="form-row">
        <div class="col-sm-6">
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="cname" value="<%= cname %>">
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label>10-digit Mobile Number</label>
                <input type="text" class="form-control" name="mobile" value="<%= mobile %>">
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-sm-6">
            <div class="form-group">
                <label>Pin Code</label>
                <input type="text" class="form-control" name="pin" value="<%= pincode %>">
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label>Locality</label>
                <input type="text" class="form-control" name="locality" value="<%= locality %>">
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-sm-6">
            <div class="form-group">
                <label>State</label>
                <input type="text" class="form-control" name="state" value="<%= state %>">
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label>City</label>
                <input type="text" class="form-control" name="city" value="<%= city %>">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label>Address</label>
            <textarea class="form-control" name="address"><%= address %></textarea>
        </div>
    </div>
    <div class="form-row">
        <div class="col-sm-6">
            <div class="form-group"> 
                <label>Delivery Type</label><br>
                <input type="radio" class="form-check-inline" checked name="adtype" value="Home">Home (All day)                            
                <input type="radio" class="form-check-inline" name="adtype" value="Home">Work (Between 10am to 5pm)
            </div>
        </div>
    </div>
    
    </fieldset>        
    <input type="submit" value="Confirm Address" class="btn btn-primary float-right mb-2">
</form>
</div>
<div class="clearfix"></div>
