<%@page import="com.vegetable.UsersDtls"%>
<%@page import="com.vegetable.UsersDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="allCss.jsp"%>
<%@include file="navbar1.jsp"%>
</head>
<body>
	
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

	<div class="container mt-5"
		style="font-family: 'IBM Plex Sans', sans-serif;">
		<div class="row">

			<div class="col-sm-6 mt-5">
				<h2 class="text-center text-danger">Edit Profile</h2>
				<hr>

				<%
					int id = Integer.parseInt(request.getParameter("uid"));
					UsersDAO dao = new UsersDAO(DbConnect.Connect());
					UsersDtls s = dao.getUserById(uid);
				%>
				<form action="../UpdateProfile" method="post">
					<input type="hidden" name="uid" value="<%=uid%>">
					<div class="row register-form">
						<div class="col-md-6">
							<div class="form-group">
								<label> First Name</label> <input type="text"
									class="form-control" value="<%=s.getFirstname()%>"
									name="firstname">
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label>Last Name</label> <input type="text" class="form-control"
									value="<%=s.getLastname()%>" name="lastname">
							</div>
						</div>
						<br>
						<div class="col-md-6 mt-2">
							<div class="form-group">
								<label> Contact</label> <input type="text" class="form-control"
									value="<%=s.getContact()%>" name="contact">
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label> Email Address</label> <input type="email"
									class="form-control" value="<%=s.getEmail()%>" name="email" readonly>
							</div>
						</div>
						
						<div class="col-md-12">
							<div class="form-group">
								<label>Address</label> 
								<textarea
									class="form-control" name="address"><%=s.getAddress()%></textarea>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<img src="../images1/<%=s.getImg()%>" height=100 width=100>
								<a href="updateImage.jsp?uid=<%=s.getUid()%>">Update Image</a>
							</div>
						</div>
					</div>
					<hr>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>