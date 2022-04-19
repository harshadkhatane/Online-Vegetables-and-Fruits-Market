<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<style>
.mybtnone:hover {
	background-color: #E40203;
}
</style>
<%@include file="navbar.jsp"%>
</head>
<body>
	
	<%
		String validMsg = (String) session.getAttribute("validMsg");
		String invalidMsg = (String) session.getAttribute("invalidMsg");

		if (validMsg != null) {
	%>
	<script>
		alert("Logged in Successfully...");
		window.location.assign("User/user_home.jsp");
	</script>
	<%
		session.removeAttribute("validMsg");
		}
	%>
	<%
		if (invalidMsg != null) {
	%>
	<script>
		alert("Username & Password Does Not Match..");
	</script>
	<%
		session.removeAttribute("invalidMsg");
		}
	%>
	
	<div class="hero-wrap hero-bread" style="background-image: url('images/vegetable.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>User Login</span></p>
            <h1 class="mb-0 bread">User Login</h1>
          </div>
        </div>
      </div>
    </div>
	<div class="container my-5">
		<h2 style="margin-top: 20px" align="center">User Login Form</h2>
		<hr>

		<div class="container-fluid" style="width: 70%; margin-top: 5%">
			<form method="post" action="login">

				<div class="form-group">
					<label for="exampleInputEmail1">Email ID</label> <input type="email"
						class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" name="email"
						placeholder="Enter Email ID">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						placeholder="Password" name="password">
				</div>
				<button type="submit" class="btn btn-primary mybtnone">Login</button>
				<button class="btn btn-primary mybtnone">
					<a href="signup.jsp" style="color: white">Signup</a>
				</button>
			</form>
		</div>
	</div>
<%@include file="footer.jsp" %>