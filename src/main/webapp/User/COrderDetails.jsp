<%@page import="com.vegetable.DbConnect"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="navbar1.jsp" />
<jsp:include flush="true" page="allCss.jsp" />
<br>
<br>
<div class="container card shadow mt-5">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid orange">User
			Orders Details</h5>
		<div class="container mt-5">
			<h5 class="text-center my-2 border-bottom text-white p-2 bg-dark">
				Order Details of No.
				<%=request.getParameter("oid")%></h5>
			<%
				Connection con = DbConnect.Connect();
				ResultSet rs = con.createStatement().executeQuery(
						"SELECT * FROM order_details inner join products on products.prodid=order_details.prodid where order_id="
								+ request.getParameter("oid"));
				ResultSet rs2 = con.createStatement().executeQuery(
						"SELECT userid,order_status,remarks from orders where order_id=" + request.getParameter("oid"));
				rs2.next();
			%>
			<p class="float-right">
				Order Status : <strong><%=rs2.getString("order_status")%></strong>
			</p>
			<p>
				Customer Name : <strong><%=DbConnect.getName(rs2.getString(1))%></strong>
			</p>

			<table class="table table-bordered table-striped table-sm">
				<thead class="table-dark">
					<th>Sr. No.</th>
					<th>Product</th>
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
						<td><%=counter%></td>
						<td><img src='../images2/<%=rs.getString("photo")%>'
							width="50" height="50"> <%=rs.getString("pname")%></td>
						<td>&#8377; <%=rs.getString("disc_price")%></td>
						<td><%=rs.getString("qty")%></td>
						<td>&#8377; <%=rs.getInt("qty") * rs.getInt("disc_price")%></td>

					</tr>
					<%
						counter++;
							total += rs.getInt("qty") * rs.getInt("disc_price");
						}
					%>
				</tbody>
				<tfoot class="table-dark">
					<tr>
						<th colspan="4" class="text-right">Total Bill Amount</th>
						<th>&#8377; <%=total%></th>
					</tr>
				</tfoot>
			</table>
			<%
				if (rs2.getString("order_status").equals("Pending")) {
			%>
			<a onclick="return confirm('Are you sure to cancel this order ?')"
				href="../CancelOrder?oid=<%=request.getParameter("oid")%>"
				class="btn btn-danger float-right mb-3">Cancel Order</a>
			<div class="clearfix"></div>
			<%
				} else if (rs2.getString("order_status").equals("Confirmed")) {
			%>
			<h5 class="text-center">Your order will be delivered to you
				within 30-45 Minutes.</h5>
			<%
				} else {
			%>
			<h5 class="text-center border border-danger text-danger p-2">
				Order Cancelled due to
				<%=rs2.getString("remarks")%></h5>
			<%
				}
			%>
		</div>
	</div>
</div>