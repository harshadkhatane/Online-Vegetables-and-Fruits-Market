<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Change Password</title>
<%@include file="allCss.jsp"%>
<%@include file="navbar1.jsp"%>
</head>
<body>
 <br>
            <%
				String msg = request.getParameter("msg");
				if ("notMatch".equals(msg)) {
			%>
			<script>
				alert("New password and Confirm password does not match!");
				window.location.assign("changePassword.jsp");
			</script>
			<%
				}
			%>
			<%
				if ("wrong".equals(msg)) {
			%>
			<script>
				alert("Your old Password is wrong!");
				window.location.assign("changePassword.jsp");
			</script>
			<%
				}
			%>
			<%
				if ("done".equals(msg)) {
			%>
			<script>
				alert("Password changed successfully!");
				window.location.assign("../index.jsp");
			</script>

			<%
				}
			%>
		
		<div class="container card shadow mt-5">
			<div class="card-body">
				<h5 class="p-2" style="border-bottom: 2px solid orange">Change Password</h5>

				<div class="container-fluid">
					<form action="changePasswordAction.jsp" method="post">

						<div class="form-row">
							<div class="col-sm-9">
								<div class="form-group">
									<label>Current Password</label> <input type="password"
										name="oldpassword" class="form-control"
										placeholder="Enter Current Password" required>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="col-sm-9">
								<div class="form-group">
									<label>New Password</label> <input type="password"
										name="newpassword" class="form-control"
										placeholder="Enter New Password" required>
								</div>
							</div>
						</div>

		                 <div class="form-row">
							<div class="col-sm-9">
								<div class="form-group">
									<label>Confirm New Password</label> <input type="password"
										name="confirmpassword" class="form-control"
										placeholder="Enter New Password Again" required>
								</div>
							</div>
						</div>
						<input type="submit" value="Submit" class="btn btn-primary">
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>