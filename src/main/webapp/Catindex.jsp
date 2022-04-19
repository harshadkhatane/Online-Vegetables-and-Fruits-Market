
<%@page import="com.vegetable.ProductDAO"%>
<%@page import="com.vegetable.Product"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<jsp:include flush="true" page="navbar.jsp"/>


<link href="css1/style.css" rel="stylesheet" type="text/css" media="all"/>

<link href="css1/menu.css" rel="stylesheet" type="text/css" media="all"/>

<script src="js1/script.js" type="text/javascript"></script>
<script src="js1/move-top.js" type="text/javascript"></script>
<script type="text/javascript" src="js1/easing.js"></script> 

<div class="hero-wrap hero-bread" style="background-image: url('images/grocery2.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Category</span></p>
            <h1 class="mb-0 bread">Category</h1>
          </div>
        </div>
      </div>
    </div> 
        
<div class="container mt-5">              
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
         <h2 class="text-center text-capitalize">CATEGORY : <%= request.getParameter("cat")%></h2>
            <%
                List<Product> list = null;
                list = ProductDAO.getProducts(false, false);
               for (Product p : list) {
                    if(p.getPcat().equals(request.getParameter("cat"))) {
            %>
            
            <div class="grid_1_of_4 images_1_of_4 overflow-hidden mt-2">
                <a href="cart1.jsp?prodid=<%= p.getProdid()%>&qty=1">
                    <img height="200" width="200" src="images2/<%= p.getPhoto()%>" alt="" /></a>
                    
                <h2 class="p-2 border mt-1"><%= p.getPname()%></h2>       

                <p class="p-0"><%= p.getPcat()%></p>
                <p class="p-1"><span class="strike">&#8377;<%= p.getPrice()%></span>
                                <span class="price">&#8377;<%= p.getDisc_price()%></span></p>
                <% if (!p.getInstock().equals("In Stock")) {%>
                <div class="pos-absolute" 
                     style="transform: rotate(-45deg);top:125px;left:-90px;width:420px">
                    <div class="alert alert-danger font-weight-bold p-2 ">
                        <%= p.getInstock()%>
                    </div>
                </div> 
                               
                <div class="button mr-0">
                    <a href="javascript:void(0)">Add to Cart</a>
                </div>
                <div class="button ml-0"><span><a href="javascript:void(0)" class="details">Details</a></span></div>                
                
                <% } else { %>
                
                <div class="button mr-0">
                    <a href="Operation?prodid=<%= p.getProdid()%>&qty=1">Add to Cart</a>
                </div>
                <div class="button ml-0"><span><a href="cart1.jsp?prodid=<%= p.getProdid()%>" class="details">Details</a></span></div>                
                
                <% } %>
            </div>
            <% }
            }
            %>
        </div>
     </div>
     </div>
 </div>  
 <hr>
<%@include file="footer.jsp" %>