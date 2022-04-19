<%@page import="com.vegetable.CartDAO"%>
<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*"%>

<% 
    String email = session.getAttribute("email").toString();	
    int uid=0;
    String firstname = "";
	String lastname = "";
	String contact = "";
	String city = "";
	String address = "";
	String img="";
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='" + email + "'");
		if (rs.next()) {
			uid = rs.getInt(1);
			firstname = rs.getString(2);
			lastname = rs.getString(3);
			contact = rs.getString(6);
			city = rs.getString(7);
			address = rs.getString(8);	
			img = rs.getString(9);
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>  
<link rel="stylesheet" href="mystyle.css">

       <%
            String count = "(empty)";
            String user = "Guest";
            Connection con = DbConnect.Connect();
            if (session.getAttribute("email") != null) {
                user = session.getAttribute("email").toString();
                count = String.valueOf(CartDAO.getCount(session.getAttribute("email").toString()));
            }
        %>

<nav class="navbar navbar-expand-sm"
	style="background-image: url('../images/background_textured1.jpg'); border-bottom: 1px solid red">
	<a class="navbar-brand" href="user_home.jsp"
		style="color: white; font-weight: bold">Online Vegetables and Fruits Market</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">

			<li class="nav-item active"><a class="nav-link"
				href="user_home.jsp" style="color: white"><i class="fas fa-home"></i>
					Home <span class="sr-only">(current)</span></a></li>

			<li class="nav-item"><a class="nav-link" href="viewBooking.jsp"
				style="color: white"><ion-icon style="margin-right:2px"
						name="briefcase-sharp"></ion-icon> <i class="fas fa-book-reader"></i> View Booking</a></li>

			<li class="nav-item"><a class="nav-link" href="sendFeedback.jsp"
				style="color: white"><ion-icon style="margin-right:2px"
						name="phone-portrait-sharp"></ion-icon><i class="far fa-paper-plane"></i> Send Feedback</a></li>

           
           <li class="nav-item dropdown"><a href=""
				class="nav-link dropdown-toggle" id="navbardrop" style="color: white"
				data-toggle="dropdown"> <i class="fab fa-codepen"></i> View Product</a>

				<div class="dropdown-menu">
				<% for (String cat : DbConnect.getCategory()) {%>
					<a href="Catindex.jsp?cat=<%= cat%>" class="dropdown-item"><%= cat%></a> 
					<% } %>
				</div>
			</li>
           
        	<li class="nav-item"><a class="nav-link"
				href="changePassword.jsp" style="color: white; text-align: right"><ion-icon
						style="margin-right:2px" name="log-in-sharp"></ion-icon>
						<i class="fas fa-cog"></i> Change Password</a></li>

			<li class="nav-item"><a class="nav-link" href="logout.jsp"
				style="color: white; text-align: right"><ion-icon
						style="margin-right:2px" name="log-in-sharp"></ion-icon> 
						<i class="fas fa-power-off"></i> Logout</a></li>

			<div class="dropdown">
				<button class="btn btn-danger dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Welcome <% out.println(firstname + " " + lastname);%></button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="profile.jsp">PROFILE</a> <a
						class="dropdown-item" href="changePassword.jsp">CHANGE
						PASSWORD</a>
				</div>
			</div>

			<div class="shopping_cart">
				<div class="cart">
					<a href="ViewCart.jsp" title="View my shopping cart" rel="nofollow">
						<span class="cart_title">Cart</span> <span class="no_product"><%= count%></span>
					</a>
				</div>
			</div>

		</ul>
	</div>
</nav>