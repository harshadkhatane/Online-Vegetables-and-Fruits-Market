<%@page import="com.vegetable.UsersDtls"%>
<%@page import="com.vegetable.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Send Feedback</title>
<%@include file="allCss.jsp" %>
<%@include file="navbar1.jsp" %>
</head>
<body>

    <%
		String successMsg = (String) session.getAttribute("successMsg");
		String errorMsg = (String) session.getAttribute("errorMsg");

		if (successMsg != null) {
	%>
	<script>
		alert("Your Feedback has been send Successfully..");
		//window.location.assign("viewCategory.jsp");
	</script>
	<%
		session.removeAttribute("successMsg");
		}
	%>
	<%
		if (errorMsg != null) {
	%>
	<script>
		alert("Something went Wrong..!!");
	</script>
	<%
		session.removeAttribute("errorMsg");
		}
	%>
 <div class="container card shadow mt-5">
 <div class="card-body">
		<h2 style="margin-top: 5%" align="center">Send Feedback</h2>
		<hr>
                
		<div class="container-fluid" style="width: 70%; margin-top: 5%">
			<form action="../feedback" method="post">
				
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputPassword4">Username</label> 
						<input type="text" class="form-control" name="firstname" value="<%out.print(firstname);%>" readonly>
					</div>
					
					<div class="form-group col-md-6">
						<label for="exampleInputPassword1">Contact</label> 
						<input type="text" class="form-control" name="contact" value="<%out.print(contact);%>" readonly>
					</div>
				</div>
				
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="exampleInputEmail1">Email</label> 
						<input type="email" class="form-control" name="email" value="<%out.print(email);%>" readonly>
					</div>

					<div class="form-group col-md-6">
						<label for="exampleInputPassword1">Full Address</label> <input
							type="text" class="form-control" id="exampleInputPassword1"
							name="address" value="<%out.print(address);%>" readonly>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label>Description</label> 
						<textarea rows="4" class="form-control" style="resize: none" name="description"></textarea>
					</div>
                </div>
               <button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
</div>	
</body>
</html>