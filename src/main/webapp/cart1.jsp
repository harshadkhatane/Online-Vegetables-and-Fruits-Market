<%@page import="com.vegetable.CartDAO"%>
<%@page import="com.vegetable.ProductDAO"%>
<%@page import="com.vegetable.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Cart</title>
<%@include file="navbar.jsp"%>

<link href="css1/style.css" rel="stylesheet" type="text/css" media="all"/>

<link href="css1/menu.css" rel="stylesheet" type="text/css" media="all"/>

<script src="js1/script.js" type="text/javascript"></script>
<script src="js1/move-top.js" type="text/javascript"></script>
<script src="js1/easing.js" type="text/javascript"></script>
<script src="js1/jquery.zoom.min.js" type="text/javascript"></script>

</head>
<body>
<br>
<div class="hero-wrap hero-bread" style="background-image: url('images/vegetable.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread">Cart</h1>
          </div>
        </div>
      </div>
    </div>

<%
    Product p = ProductDAO.findByID(request.getParameter("prodid"));
%>
<div class="container my-2 mt-5">
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

    <div class="row">
        <div class="col-sm-1">
            <img onclick="changeme(1)" src="images2/<%= p.getPhoto()%>" 
                 title="First Photo" class="m-1">
        </div>
        <div class="col-sm-4">
            <div class="card">                          
                <img id="pic1" src="images2/<%= p.getPhoto()%>" 
                     title="First Photo" class="card-img-top m-1 image-zoom">
            </div>            
        </div>
        <div class="col-sm-7">
            <p class="bg-dark text-white text-center p-2" style="font-size: 1.4em;">Product Description</p>
            
            <h2 class="text-danger my-3" style="font-size : 30px"><%= p.getPname()%></h2>
            
            <h5 class="bg-dark text-white p-2" style="background-image: url('images/background_textured1.jpg');">Product Features</h5>
            <!--<p class="pr-4 text-justify"><%= p.getDescr().replaceAll("\n", "<br>")%></p>-->
            <ul class="list-group">
                <%
                    for (String feature : p.getDescr().split("\n")) {
                %>
                <li class="list-group-item"><%= feature%></li>
                    <%
                        }
                    %>
            </ul>
            <h4>Price : <strong class="text-danger">&#8377; <%= p.getDisc_price()%></strong>
                <del><%= p.getPrice()%></del>
                <%= p.getRemarks()%>
            </h4>
            <%                
                if (session.getAttribute("uid") != null) {
                    String uid = session.getAttribute("uid").toString();
                    if (!CartDAO.checkItem(String.valueOf(p.getProdid()), uid)){ %>
            <form action="Operation">
                <input type="hidden" name="prodid" value="<%= request.getParameter("prodid")%>" >
                Quantity : <input name="qty" type="number" value="1" min="1" max="10">       
                <br>
                <div class="btn-group mt-3">
                    <button class="btn btn-danger mr-2" name="add">Add to Cart</button>
                    <button class="btn btn-success" name="buy">Buy Now</button>                        
                </div>
            </form>
            <% } else { %>
            <div class="alert alert-success font-weight-bold text-center">
                Item already added to Cart.
            </div>
            <% }
            } else {
            %>
            <div class="alert alert-danger text-center font-weight-bold">
            Please login to buy products..!!
            </div>
            <%
                    }                
            %>
        </div>
    </div>
</div>     
<script>
    function changeme(n) {
        let id = "pic" + n;
        $(".card-img-top").addClass("d-none");
        $("#" + id).removeClass("d-none");
    }
    $(document).ready(function () {
        $('.image-zoom')
                .wrap('<span style="display:inline-block"></span>')
                .css('display', 'block')
                .parent()
                .zoom({
                    url: $(this).find('img').attr('data-zoom')
                });
    });
</script>
<%@include file="footer.jsp" %>
</body>
</html>