<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="com.ba.dao.connectDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Details</title>

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
	background-image: url('BackGroundImg.jpg');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	color: white;
}

table {
	background-color: transparent;
	color: white;
	/* border-radius: 100px; */
}

.middlePart {
	display: flex;
}

th {
	color: white;
}

tbody {
	border: 1px solid #5b5c5c;
}

.overlay {
	background-color: rgba(0, 0, 0, 0.6);
	position: fixed;
	/* due to this the overlay class now gets applied to the entire page and  not only the visible part of the screen */
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.content {
	position: relative;
	z-index: 2;
	text-align: center;
	padding-top: 2vh;
}

.modal .fade {
	z-index: 2;
}

.modal {
	color: black;
}

/* SIDE BAR STYLING */
.row .col-md-2 {
	box-shadow: 0px 10px 10px #B98522;
}

.list-group a {
	background-color: transparent;
	color: white;
	height: 50px;
}

.list-group .active {
	color: #B98522;
	background-color: transparent !important;
	border: 0;
	font-size: x-large;
}

/*  side bar Styling end*/

/* to make the table fit all the content and make it scrollable */
.table-container {
	max-height: 475px; /* Adjust the height as needed */
	overflow-y: auto; /* Enable vertical scroll */
	border: 1px solid white;
	position: relative;
}

.table thead {
	position: sticky;
	top: 0;
	background-color: #343a40; /* Dark background for the header */
	border: 1px solid #ced2d2;
}

.table th, .table td {
	min-width: 50px; /* Adjust based on content */
	min-height: 100px;
	text-align: center;
}
/* table end */
</style>
</head>
<body>
	<div class="overlay"></div>
	<%@include file="navbar.html"%>
	<div class="middlePart">
		<%@include file="sideBarDropDownMenu.html"%>
		<div class="container-fluid"
			style="margin-top: 80px; padding-left: 230px;">
			<div class="row">
				<div class="col col-md-12 pt-1" style="z-index: 2;">

					<div class="row ">
						<div class="col col-5">
							<h2 class="ms-3">
								<i class="fa-solid fa-users"></i> Customer Details
							</h2>
						</div>
						<div class="col col-4 mt-2">
							<h5>
						</div>
						<div class="col col-3">
							<form class="d-flex" role="search">
								<input id="searchInput" class="form-control me-2" type="search"
									placeholder="Search Customer Purchase" aria-label="Search"
									onkeyup="searchTable()">
								<button class="btn btn-light" type="submit">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>

							</form>
						</div>
					</div>
					<!-- here model file data imported in which the data from the database is present from the above displayList.java class -->

					<div class="content">
						<div class="table-container">



							<table class="table table-bordered">
								<thead class="table-dark">
									<tr>
										<th>Customer ID</th>
										<th>Customer Name</th>
										<th>Contact No.</th>
										<th>Gender</th>
										<th>Total Amount</th>
										<th>View</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody class="table-secondary" id="tableData">
									<%
									Connection conn = connectDB.getConnection();
									String query = "SELECT customer_id, name, contact_no, gender FROM customer_detail";
									PreparedStatement ps = conn.prepareStatement(query);
									ResultSet rs = ps.executeQuery();

									while (rs.next()) {
										int customerId = rs.getInt("customer_id");
										String name = rs.getString("name");
										String contactNo = rs.getString("contact_no");
										String gender = rs.getString("gender");

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
										<td><%=customerId%></td>
										<td><%=name%></td>
										<td><%=contactNo%></td>
										<td><%=gender%></td>
										<td>₹<%=totalAmount%></td>
										<td><a
											href="customerPurchases.jsp?customer_id=<%=customerId%>"
											class="btn btn-info btn-sm"> View Purchases </a></td>
										<td>
											<%-- <a
											href="editCustomerData?ID=<%=rs.getInt("customer_id")%>"
											class="btn btn-warning btn-sm">Edit <i
												class="fa-solid fa-pen-to-square"></i></a> <!-- here ID is a variable declared for storing the id fetched from getID method -->
											<a href="deleteCustomerData?ID=<%=rs.getInt("customer_id")%>"
											onclick="confirmDelete(event)" class="btn btn-danger btn-sm">Delete
												<i class="fa-solid fa-trash-can"></i>
										</a> --%> <a href="editCustomer.jsp?id=<%=customerId%>"
											class="btn btn-warning btn-sm">Edit</a> <a
											href="deleteCustomer?id=<%=customerId%>"
											class="btn btn-danger btn-sm"
											onclick="return confirm('Are you sure?')">Delete</a>

										</td>

									</tr>
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
						<br>
						<div class="text-center">
							<a href="addCustomerDetails.jsp" class="btn btn-primary">Add
								New Customer</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script src="bootstrap.bundle.min.js"></script>
	<script>
		
		
		function searchTable(){
			let input = document.getElementById("searchInput").value.toLowerCase();
			let row = document.querySelectorAll("#tableData tr"); /*  selects all rows inside the <tbody>. */
			
			row.forEach(row=>{
				let text = row.innerText.toLowerCase();
				row.style.display = text.includes(input) ? "" : "none"; /* If text.includes(input) is true → The row remains visible: */
																		/* If text.includes(input) is false → The row is hidden */
			});
		}
	</script>
</body>
</html>