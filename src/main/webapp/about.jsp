<%@page import="java.sql.*"%>
<%@include file="navbar.jsp"%>
<div class="hero-wrap hero-bread"
	style="background-image: url('images/vegetable.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.jsp">Home</a></span> <span>About
						us</span>
				</p>
				<h1 class="mb-0 bread">About us</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
	<div class="container mt-4">
		<div class="row">
			<div
				class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center"
				style="background-image: url(images/about.jpg);"></div>
			<div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
				<div class="heading-section-bold mb-4 mt-md-4">
					<div class="ml-md-0">
						<h2 class="mb-4">Welcome to Online Vegetables and Fruits Market</h2>
					</div>
				</div>
				<div class="pb-md-5">
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in Bookmarksgrove right at the coast of the
						Semantics, a large language ocean.</p>
					<p>But nothing the copy said could convince her and so it
						didn’t take long until a few insidious Copy Writers ambushed
						her, made her drunk with Longe and Parole and dragged her into
						their agency, where they abused her for their.</p>

				</div>
			</div>
		</div>
	</div>
</section>


<section class="ftco-section ftco-counter img mt-5" id="section-counter"
	style="background-image: url(images/bg_3.jpg);">
	<div class="container">
		<div class="row justify-content-center py-5">
			<div class="col-md-10">
				<div class="row">
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<strong class="number" data-number="10">0</strong> <span>Happy
									Customers</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<strong class="number" data-number="01">0</strong> <span>Branches</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<strong class="number" data-number="04">0</strong> <span>Partner</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<strong class="number" data-number="05">0</strong> <span>Awards</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section testimony-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate text-center">
				<span class="subheading">Testimony</span>
				<h2 class="mb-4">Our satisfied customer says</h2>
				<p>First, have a definite, clear practical ideal; a goal, an
					objective. Second, have the necessary means to achieve your ends;
					wisdom, money, materials, and methods. Third, adjust all your means
					to that end.</p>
			</div>
		</div>
		<div class="row ftco-animate">
			<div class="col-md-12">
				<div class="carousel-testimony owl-carousel">
					<%
						try {
							Connection con2 = DbConnect.Connect();
							Statement st = con2.createStatement();
							ResultSet rs = st.executeQuery(
									"select users.img,feedback.* from users INNER JOIN feedback ON users.email=feedback.email");
							int i = 0;
							while (rs.next()) {
								i++;
					%>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5">
								<img src='images1/<%=rs.getString("img")%>' width="100"
									height="100"> <span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line"><%=rs.getString("description")%></p>
								<p class="name"><%=rs.getString("username")%></p>
								<span class="position"><%=rs.getString("feedbackDate")%></span>
							</div>
						</div>
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
</section>

<section class="ftco-section bg-light">
	<div class="container">
		<div class="row no-gutters ftco-services">
			<div
				class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-shipped"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Free Shipping</h3>
						<span>On order over $100</span>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-diet"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Always Fresh</h3>
						<span>Product well package</span>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-award"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Superior Quality</h3>
						<span>Quality Products</span>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-customer-service"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Support</h3>
						<span>24/7 Support</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="footer.jsp"%>