<%@page import="com.vegetable.UsersDtls"%>
<%@page import="com.vegetable.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Image</title>
<%@include file="navbar1.jsp"%>
<%@include file="allCss.jsp"%>
</head>
<body>
	
	<%
		String msg = request.getParameter("msg");
		if ("successMsg".equals(msg)) {
	%>
	<script>
		alert("Image Updated Successfully...");
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
				<h2 class="text-center text-danger">Update Image</h2>
				<hr>

				<%
					int cid = Integer.parseInt(request.getParameter("uid"));
				    UsersDAO dao = new UsersDAO(DbConnect.Connect());
				    UsersDtls s = dao.getUserById(uid);
				%>
				<form action="../editImage" method="post" enctype="multipart/form-data">
					<input type="hidden" name="uid" value="<%=uid%>">
					<div class="row register-form">

						<div class="col-sm-6">
							<div class="form-group">
								<label>Image</label> <input type="file" class="form-control"
									name="pic">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<img src="../images1/<%=s.getImg()%>" height=100 width=100>
							</div>
						</div>
					</div>
					<hr>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Update</button>
						<a href="profile.jsp?uid=<%=uid%>" class="btn btn-primary mr-2">Back
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>