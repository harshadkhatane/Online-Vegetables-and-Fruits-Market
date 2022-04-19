<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="com.vegetable.Product"%>
<%@page import="com.vegetable.DbConnect"%>
<%@page import="com.vegetable.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home Page</title>
<%@include file="allCss.jsp" %>
<%@include file="navbar1.jsp" %>

<link href="../css1/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css1/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="../css1/menu.css" rel="stylesheet" type="text/css" media="all"/>
<script src="../js1/jquery.min.js"></script>
<script src="../js1/script.js" type="text/javascript"></script>
<script src="../js1/move-top.js" type="text/javascript"></script>
<script src="../js1/easing.js"type="text/javascript" ></script> 
        
</head>
<body>

 <div id="demo" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
    <li data-target="#demo" data-slide-to="4"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner" style="width:100%;height:550px">
    <div class="carousel-item active">
      <img src="../images/Userhome.jpeg" alt="Los Angeles" style="width:100%;height:550px">
    </div>
    <div class="carousel-item">
      <img src="../images/vegetable.jpg" alt="Chicago" style="width:100%;height:550px">
    </div>
    <div class="carousel-item">
      <img src="../images/about.jpg" alt="New York" style="width:100%;height:550px">
    </div>

    <div class="carousel-item">
      <img src="../images/vegetable1.jpg" alt="New York" style="width:100%;height:550px">
    </div>
    
    <div class="carousel-item">
      <img src="../images/vegetable2.jpg" alt="New York" style="width:100%;height:550px">
    </div>
        
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<!-- Show Categories pic -->
    
<br>
<div class="container">
    <center> <div class="search_box">
            <form action="SearchResult1.jsp">
              <input type="text" list="products" value="" name="spname" placeholder="Product to Search">
              <input type="submit" value="SEARCH" style="height:100%">
           </form>
         </div> </center>
  <br>
		<h2 class="text-danger mt-5">Features Product</h2>
         <hr>
		<div class="row mb-5">

       
<div class="main">
    <div class="content">
        <%
            if (session.getAttribute("msg") != null) {
        %>
        <div class="row">
            <div class="col-sm-5 mx-auto">
                <div class="alert alert-success text-center p-1 my-1">
                    <strong><%= session.getAttribute("msg")%></strong>
                </div>
            </div>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>
        <div class="section group">
           <%
               try {
				Connection con1 = DbConnect.Connect();
				Statement st = con1.createStatement();
				ResultSet rs = st.executeQuery("select * from products where featured='Yes'");
				int i = 0;
				while (rs.next()) {
					i++;
            %>
            
            <div class="grid_1_of_4 images_1_of_4 overflow-hidden">
                <a href="cart.jsp?prodid=<%= rs.getInt("prodid")%>&qty=1">
                    <img height="200" width="200" src="../images2/<%= rs.getString("photo")%>" alt="" /></a>
                    
                <h2 class="p-2 border mt-1"><%= rs.getString("pname")%></h2>       

                <p class="p-0"><%= rs.getString("pcat")%></p>
                <p class="p-1"><span class="strike">&#8377;<%= rs.getString("price")%></span>
                                <span class="price">&#8377;<%= rs.getString("disc_price")%></span></p>
                <% if (!rs.getString("instock").equals("In Stock")) {%>
                <div class="pos-absolute" 
                     style="transform: rotate(-45deg);top:125px;left:-90px;width:420px">
                    <div class="alert alert-danger font-weight-bold p-2 ">
                        <%= rs.getString("instock")%>
                    </div>
                </div> 
                               
                <div class="button mr-0">
                    <a href="javascript:void(0)">Add to Cart</a>
                </div>
                <div class="button ml-0"><span><a href="javascript:void(0)" class="details">Details</a></span></div>                
                
                <% } else { %>
                
                <div class="button mr-0">
                    <a href="../Operation?prodid=<%= rs.getInt("prodid")%>&qty=1">Add to Cart</a>
                </div>
                <div class="button ml-0"><span><a href="cart.jsp?prodid=<%= rs.getInt("prodid")%>" class="details">Details</a></span></div>                
                
                <% } %>
            </div>
            <%
				}
				} catch (Exception e) {
					System.out.println(e);
				}
			%>
        </div>
     </div>
     </div>
</div>
</div>
</body>
</html>