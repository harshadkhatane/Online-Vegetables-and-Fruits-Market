<%@include file="navbar.jsp" %>
<!-- FontAwesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
		
    <div class="hero-wrap hero-bread" style="background-image: url('images/vegetable.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Contact us</span></p>
            <h1 class="mb-0 bread">Contact us</h1>            
          </div>
        </div>
      </div>
    </div>

    <section>
    <div class="container py-5">
   <div class="card">
     <div class="card-body">
       <h1 class="font-weight-light text-center py-3">Contact Us</h1>
       <div class="row">
         <div class="col-lg-6 col-md-12 col-sm-12">
          
          <div class="row pt-3">
            <div class="col-lg-1 offset-1 col-md-2 col-sm-2">
              <span style="font-size: 30px; color: cadetblue"><i class="fas fa-map-marker-alt"></i></span>
            </div>
            
             <div class="col-lg-10 col-md-9 col-sm-9">
               <h3 class="font-weight-light">Find Us at the office</h3>
               <p>40/8147,<br> 
               C II Floor, Narakathara Road,<br> 
               Ernakulam, Kerala 682035
                  
               </p>
            </div>            
          </div>
          
          <div class="row pt-3">
            <div class="col-lg-1 offset-1 col-md-2 col-sm-2">
              <span style="font-size: 30px; color: coral"><i class="fas fa-phone-volume"></i></span>
            </div>
            
             <div class="col-lg-10 col-md-9 col-sm-9">
               <h3 class="font-weight-light">Give Us a Ring</h3>
               <p> Harshad khatane<br>
                 +91 8983389819<br>
                 Ernakulam, Kerala
               </p>
            </div>            
          </div>
          
         </div>
         
         <div class="col-lg-6 col-md-12 col-sm-12">
           <form action="contact" method="post">
             <div class="form-row">
                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                  <label>Full Name</label>
                  <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                </div>
                
                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                  <label>Contact Number</label>
                  <input type="text" name="contact" class="form-control" placeholder="Contact Number" required>
                </div>
                
                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                  <label>Email Id</label>
                  <input type="email" name="emailid" class="form-control" placeholder="Email ID" required>
                </div>
                
                 <div class="form-group col-lg-6 col-md-12 col-sm-12">
                  <label>Subject</label>
                  <input type="text" name="subject" class="form-control" placeholder="Enter Subject" required>
                </div>
                
                 <div class="form-group col-lg-12 col-md-12 col-sm-12">
                  <label>Message</label>
                  <textarea name="message" class="form-control" placeholder="Message....."></textarea>
                </div>
                
                 <div class="form-group col-lg-6 col-md-12 col-sm-12">
                   <input type="submit" value="Send" class="form-control btn btn-primary">
                 </div>
                
                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                   <input type="reset" value="Clear" class="form-control btn btn-primary">
                </div>
                
             </div>
           </form>
         </div>
       </div>
       
     </div>
   </div>
 </div>
    
    </section>

<%@include file="footer.jsp" %>