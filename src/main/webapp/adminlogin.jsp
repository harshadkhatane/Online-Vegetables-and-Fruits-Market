<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<!-- font awesome cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
body {
	opacity: 0.9;
}
</style>
</head>

<div class="hero-wrap hero-bread" style="background-image: url('images/vegetable1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Admin Login</span></p>
            <h1 class="mb-0 bread">Admin Login</h1>
          </div>
        </div>
      </div>
    </div>
	<div class="row">
		<div class="col-lg-5 m-auto">
			<div class="card mt-5 bg-dark">
				<div class="card-title text-center mt-3">
					<img src="images/user.png" width="150" height="150">
					<h2 style="color: white" class="mt-1">Admin Login</h2>
				</div>

				<%
					String validMsgg = (String) session.getAttribute("validMsgg");
					String invalidMsgg = (String) session.getAttribute("invalidMsgg");

					if (validMsgg != null) {
				%>
				<script>
					alert("Logged in Successfully");
					window.location.assign("admin/dashboard.jsp");
				</script>
				<%
					session.removeAttribute("validMsgg");
					}
				%>
				<%
					if (invalidMsgg != null) {
				%>
				<script>
					alert("Invalid Creadential !! Please Try Again..");
				</script>
				<%
					session.removeAttribute("invalidMsgg");
					}
				%>


				<div class="card-body">
					<form action="adminlogin" method="post">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i
									class="fa fa-user fa-2x"></i>
								</span>
							</div>
							<input type="text" name="username" class="form-control py-3"
								placeholder="Enter User Name">
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i
									class="fa fa-lock fa-2x"></i>
								</span>
							</div>
							<input type="password" name="password" class="form-control py-3"
								placeholder="Enter Password">
						</div>

						<input type="submit" value="Login" class="btn btn-success px-5">
						<a href="index.jsp" class="float-right mt-2 text-white">Go
							Back To Home</a>
					</form>
				</div>
			</div>
		</div>
	</div>

<%@include file="footer.jsp" %>