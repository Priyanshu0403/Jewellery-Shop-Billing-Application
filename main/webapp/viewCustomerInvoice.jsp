<%-- <%@ page import="java.util.List"%>
<%@ page import="com.ba.model.customerInfo"%> --%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="com.ba.dao.connectDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Invoice Generator</title>
<link href="bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap"
	rel="stylesheet">
<link href="navbar.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	rel="stylesheet">

<style>
body {
	background-image: url(BackGroundImg.jpg);
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

tbody {
	color: white;
	border: 1px solid #5b5c5c;
}

.overlay {
	background-color: rgba(0, 0, 0, 0.6);
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.middlePart {
	display: flex;
}

.table-responsive tbody {
	color: white;
}

/* Bill Styling */
.BillNoInfo p {
	font-size: 8px;
	margin-left: 20px;
	margin-bottom: 0px;
}

/* to make the table fit all the content and make it scrollable */
.table-container {
	max-height: 450px; /* Adjust the height as needed */
	overflow-y: auto; /* Enable vertical scroll */
	border: 1px solid white;
	position: relative;
}

.table thead {
	position: sticky;
	top: 0;
	z-index: 1000;
	border: 1px solid #ced2d2;
}

.table th, .table td {
	min-width: 0px; /* Adjust based on content */
	text-align: center;
}
/* table end */
</style>
</head>

<body>
	<div class="overlay"></div>
	<!-- Navbar -->
	<%@include file="navbar.html"%>

	<div class="middlePart">
		<%@include file="sideBarDropDownMenu.html"%>
		<div class="container-fluid "
			style="margin-top: 80px; padding-left: 250px;">
			<div class="row">
				<div class="col col-md-12 pt-1" style="z-index: 2;">
					<div class="row">
						<div class="col col-4">
							<h2 class="mb-2" style="color: white;">Invoice Generator</h2>
						</div>
						<div class="col col-4"></div>
						<div class="col col-4">
							<form class="d-flex" role="search" onsubmit="return false;">
								<input class="form-control me-2" type="search"
									placeholder="Search Customer" aria-label="Search"
									onkeyup="searchTable()">
								<button class="btn btn-light	" type="submit">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</form>
						</div>
					</div>



					<h4 class="mt-1" style="color: white;">Generated Invoices</h4>

					<!-- Invoice Table -->
					<div class="table-container">
						<table class="table table-bordered">
							<thead class="table-dark">
								<tr>
									<th>Invoice ID</th>
									<th>Customer Name</th>
									<th>Total Amount</th>
									<!-- <th>Date</th> -->
									<th>Action</th>
									<th>View Invoice</th>
								</tr>
							</thead>
							<%
							/* List<customerInfo> cst1 = (List<customerInfo>) session.getAttribute("invoice_list");
							if (cst1 != null && !cst1.isEmpty()) {
								for (customerInfo cst2 : cst1) { */
							%>
							<tbody class="table-secondary" id="tableData">
								<%
								Connection conn = connectDB.getConnection();
								String query = "SELECT customer_id, name FROM customer_detail";
								PreparedStatement ps = conn.prepareStatement(query);
								ResultSet rs = ps.executeQuery();

								while (rs.next()) {
									int customerId = rs.getInt("customer_id");
									String name = rs.getString("name");

									// Now fetch total for this customer
									String totalQuery = "SELECT total FROM customer_purchases WHERE customer_id = ?";
									PreparedStatement totalStmt = conn.prepareStatement(totalQuery);
									totalStmt.setInt(1, customerId);
									ResultSet totalRs = totalStmt.executeQuery();

									double totalAmount = 0;
									while (totalRs.next()) {
										totalAmount += totalRs.getDouble("total");
									}
								%>
								<tr>
									<td>INV<%=customerId%></td>
									<td><%=name%></td>
									<td>₹<%=totalAmount%></td>

									<td><a href="editCustomer.jsp?id=<%=customerId%>"
										class="btn btn-warning btn-sm">Edit</a> <a
										href="deleteCustomer?id=<%=customerId%>"
										class="btn btn-danger btn-sm"
										onclick="return confirm('Are you sure?')">Delete</a></td>
									<td><a class="btn btn-sm btn-primary"
										href="viewInvoice.jsp?id=<%=rs.getInt("customer_id")%>">View</a></td>
								</tr>
								<%-- <tr>
									<td>INV<%=cst2.getID()%></td>
									<td><%=cst2.getCUSTOMERNAME()%></td>
									<td>₹<%=cst2.getTOTAL()%></td>
									<td><%=cst2.getDATE()%></td>
									<td><a class="btn btn-sm btn-primary"
										href="viewInvoice?ID=<%=cst2.getID()%>">View</a></td>
								</tr> --%>
								<%
								totalRs.close();
								totalStmt.close();
								}

								rs.close();
								ps.close();
								conn.close();
								%>
							</tbody>

						</table>

					</div>

					<!-- Button to Open Modal -->
					<br>
					<div class="text-center">
						<a type="button" class="btn btn-primary mb-4"
							href="addCustomerDetails.jsp">Add New Invoice(Customer)</a>
					</div>

				</div>
			</div>
		</div>






	</div>


	<script src="bootstrap.bundle.min.js"></script>
	<script>
		
		
		function searchTable(){
			let input = document.getElementById("searchInput").value.toLowerCase();
			let row = document.querySelectorAll("#tableData tr");
			
			row.forEach(row=>{
				let text = row.innerText.toLowerCase();
				row.style.display = text.includes(input) ? "":"none";
			});
		}
	</script>

</body>
</html>