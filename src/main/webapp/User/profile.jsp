<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<%@include file="navbar1.jsp"%>
<%@include file="allCss.jsp"%>
</head>
<body>
<br><br>
	<%
		String msg = request.getParameter("msg");
		if ("successMsg".equals(msg)) {
	%>
	<script>
		alert("Profile Updated Successfully...");
		window.location.assign("profile.jsp");
	</script>
	<%
		}
	%>
	<%
		if ("errorMsg".equals(msg)) {
	%>
	<script>
		alert("Something went Wrong...");
	</script>
	<%
		}
	%>

<!-- Profile -->	
	<div class="container mt-2">
     <h2 class="text-center text-danger">PROFILE</h2>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Full Name : </b>

       </div>
       <div class="col-md-6" style="text-transform: capitalize">
           <%out.println(firstname +" "+lastname); %>  
       </div> 
     </DIV>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Contact Number : </b>
        
       </div>
       <div class="col-md-6" style="text-transform: capitalize">
               <%out.println(contact); %> 
       </div> 
     </DIV>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Image : </b>
        
       </div>
       <div class="col-md-6" style="text-transform: capitalize">
               <img src="../images1/<%out.print(img);%>" height=100 width=100>
       </div> 
     </DIV>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Email ID : </b>
        
       </div>
       <div class="col-md-6">
               <%out.println(email); %> 
       </div> 
     </DIV>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Address : </b>
        
       </div>
       <div class="col-md-6" style="text-transform: capitalize">
              <%out.println(address); %>
       </div> 
     </DIV>
     <hr>     
     <a href="editProfile.jsp?uid=<%= uid %>" class="btn btn-primary mt-5">Edit Profile</a>
   </div>
	
</body>
</html>