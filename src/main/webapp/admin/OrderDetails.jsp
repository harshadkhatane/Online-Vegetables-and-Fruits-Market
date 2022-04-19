<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<link rel="stylesheet" href="../component/sidebar.css">
<script type="text/javascript"
	src="../js1/sidebar.js"></script>
<title>Admin Dashboard</title>

<style type="text/css">
.nav-item {
	padding: 3px !important;
}

.list-group-item {
	padding: 8px !important;
}

.container1 {
	background-color: lightgrey;
	border-radius: 8px;
}

h2, h4 {
	padding: 3px;
}

.mydiv:hover {
	transform: translateY(-10px)
}

.glow {
	font-size: 80px;
	color: #fff;
	text-align: center;
	-webkit-animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from { 
  text-shadow :0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073,
	0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }

  to {
	text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px
		#ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}
</style>
</head>

<body>
	<!-- Vertical navbar start -->
	<div class="bg-white vertical-nav" id="sidebar">

		<div class="bg-light py-4 px-3 mb-1">
			<p class="font-weight-bold text-uppercase px-3 sidebar-title text-center"><span style="color:green">Online Vegetables and Fruits</span> <span style="color:red">Market</span></p>

			<div class="media d-flex align-items-center">
				<img src="../images/admin.png" width="90" height="90"
					class="mr-3 rounded-circle img-thumbnail shadow-sm">

				<div class="media-body">
					<h4 class="mb-0">Admin</h4>
					<p class="text-muted mb-0">admin@gmail.com</p>
				</div>
			</div>
		</div>

		<ul class="nav flex-column bg-white">

			<li class="nav-item"><a href="dashboard.jsp"
				class="nav-link text-dark bg-light"> <i
					class="fas fa-tachometer-alt fa-fw mr-3 text-primary"></i>
					Dashboard
			</a></li>
			
						<li class="nav-item"><a href="view_User.jsp"
				class="nav-link text-dark bg-light"><i class="fas fa-users fa-fw mr-3 text-primary"></i> 
					View User
			</a></li>
			
			<li class="nav-item"><a href="view_Booking.jsp"
				class="nav-link text-dark bg-light"><i class="fas fa-book-reader fa-fw mr-3 text-primary"></i>
					View Booking
			</a></li>
			
			<li class="nav-item"><a href="view_Feedback.jsp"
				class="nav-link text-dark bg-light"> <i class="fas fa-comment-dots fa-fw mr-3 text-primary"></i>
					View FeedBack
			</a></li>

			<li class="nav-item dropdown"><a href=""
				class="nav-link dropdown-toggle text-dark bg-light" id="navbardrop"
				data-toggle="dropdown"> <i class="fab fa-product-hunt fa-fw mr-3 text-primary"></i> Product</a>

				<div class="dropdown-menu">
					<a href="addProduct.jsp" class="dropdown-item">Add Product</a> 
					<a href="viewProduct.jsp" class="dropdown-item">View Product</a>
				</div>
			</li>
			
			<li class="nav-item dropdown"><a href=""
				class="nav-link dropdown-toggle text-dark bg-light" id="navbardrop"
				data-toggle="dropdown"> <i class="fab fa-codepen fa-fw mr-3 text-primary"></i> Category</a>

				<div class="dropdown-menu">
					<a href="addCategory.jsp" class="dropdown-item">Add Category</a> 
					<a href="viewCategory.jsp" class="dropdown-item">View Category</a>
				</div>
			</li>
			
			<li class="nav-item dropdown"><a href=""
				class="nav-link dropdown-toggle text-dark bg-light" id="navbardrop"
				data-toggle="dropdown"> 
				<i class="fas fa-file-contract fa-fw mr-3 text-primary"></i> Contact Us Queries</a>

				<div class="dropdown-menu">
					<a href="unreadQueries.jsp" class="dropdown-item">Unread Queries</a> 
					<a href="readQueries.jsp" class="dropdown-item">Read Queries</a>
				</div>
			</li>
			
			<li class="nav-item"><a href="search.jsp"
				  class="nav-link text-dark bg-light"> <i
					class="fas fa-tachometer-alt fa-fw mr-3 text-primary"></i>
					Search
			   </a></li>
			   				
				<li class="nav-item dropdown"><a href=""
				class="nav-link dropdown-toggle text-dark bg-light" id="navbardrop"
				data-toggle="dropdown"> <i
					class="fas fa-cloud-moon-rain fa-fw mr-3 text-primary"></i> Report</a>

				<div class="dropdown-menu">
					<a href="betweenBookingQueries.jsp" class="dropdown-item">Booking B/W Dates</a>
				</div></li>
			
			<li class="nav-item"><a href="changePassword.jsp"
				class="nav-link text-dark bg-light"> <i class="fas fa-cog fa-fw mr-3 text-primary"></i> 
					Change Password
			</a></li>
				
			<li class="nav-item"><a href="../logout"
				class="nav-link text-dark bg-light"> <i
					class="fas fa-power-off fa-fw mr-3 text-primary"></i>
					Logout
			</a></li>
			
		</ul>
	</div>

	<!-- Vertical navbar end -->

	<!-- content placeholder start -->

	<div class="page-content p-4" id="content">
		<a data-toggle="modal" data-target="#exampleModalCenter" title="logout" class="text-white float-right"><i
			class="fas fa-power-off"></i> <b>Logout</b></a>

		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fas fa-bars mr-2"></i> <small
				class="text-uppercase font-weight-bold">Toggle</small>
		</button>

<!-- Logout Model -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="text-center">
        <h4>Do You Want to Logout</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
        </div>
      </div>
     </div> 
    </div>
  </div>
<!-- Close Logout Model -->


<div class="container card shadow m-5">
<div class="card-body">
<h5 class="p-2" style="border-bottom: 2px solid orange">Orders Details</h5>
<div class="container mt-5">
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
        <td><img src='../images2/<%= rs.getString("photo")%>' width="50" height="30"></td>  
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
        <form action="../RejectOrder">
            <div class="input-group">
                <input type="hidden" name="oid" value="<%= request.getParameter("oid")%>" />
                <input type="text" name="reason" placeholder="Reason for Cancel" class="form-control">
                <div class="input-group-append">
                    <button class="btn btn-danger float-right mb-3">Cancel Order</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-sm-2">
        <a class="btn btn-primary" href="../ConfirmOrder?oid=<%= request.getParameter("oid")%>">Confirm Order</a>
    </div>
</div>
<% }  else { %>
<h4 class="bg-red text-center p-2">Order Cancelled : <%= remarks %></h4>
<% } %>
</div>
</div>
</div>

</body>
</html>