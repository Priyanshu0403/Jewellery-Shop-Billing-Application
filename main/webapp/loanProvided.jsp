<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="com.ba.dao.connectDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loan Management</title>
<link href="bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap"
	rel="stylesheet">
<link href="navbar.css" rel="stylesheet">
<link href="sideBarDropDownMenu.css" rel="stylesheet">
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

.container {
	position: relative;
	z-index: 2;
}

.middlePart {
	display: flex;
}

.overlay {
	background-color: rgba(0, 0, 0, 0.6);
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.fade {
	color: black;
	text-align: center;
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
</style>
</head>
<body>
	<div class="overlay"></div>

	<%@include file="navbar.html"%>

	<div class="middlePart">
		<%@include file="sideBarDropDownMenu.html"%>
		<div class="container-fluid "
			style="margin-top: 80px; padding-left: 250px;">
			<div class="row">
				<div class="col col-md-12 pt-1" style="z-index: 2;">
					<div class="row ">
						<div class="col col-5">
							<h2 class="ms-3">
								<i class="fa-solid fa-users"></i>Loan Management
							</h2>
						</div>
						<div class="col col-4 mt-2">
							<h5>
								<%-- Total Number Of Customers:
								<%=totalCustomers%></h5> --%>
						</div>
						<div class="col col-3">
							<form class="d-flex" role="search">
								<div class="row">
									<div class="input-group">
										<div class="col col-10 ">
											<input id="searchInput" class="form-control me-2"
												type="search" placeholder="Search Customer Purchase"
												aria-label="Search" onkeyup="searchTable()">
										</div>
										<div
											class="col d-flex justify-content-center align-items-center btn btn-light">
											<i class="fa-solid fa-magnifying-glass "></i>
										</div>
									</div>
								</div>
								<button class="btn btn-secondary" type="submit">
									<i class="fa-solid fa-xmark"></i>
								</button>

							</form>
						</div>
					</div>

					<div class="content">
						<div class="table-container">
							<!-- Loan List -->

							<table class="table table-bordered">
								<thead class="table-dark">
									<tr>
										<th>loan no.</th>
										<th>Customer Name</th>
										<th>Contact No.</th>
										<th>Loan Amount (₹)</th>
										<th>Interest (%)</th>
										<th>Start Date</th>
										<th>Due Date</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody class="table-secondary" id="tableData">
									<%
									try {
										Connection conn = connectDB.getConnection();
										String query = "SELECT * FROM loan_customers";
										PreparedStatement ps = conn.prepareStatement(query);
										ResultSet rs = ps.executeQuery();

										while (rs.next()) {
											int loanNo = rs.getInt("loan_no");
											String name = rs.getString("customer_name");
											Long contactNo = rs.getLong("phone_no");
											double loanAmount = rs.getDouble("loan_amount");
											double interest = rs.getDouble("interest_percent");
											String date = rs.getString("loan_date");
											double monthly = rs.getDouble("monthly_interest");

											// Now fetch total for this customer
									%>
									<!-- Dynamic Loan Data -->
									<tr>
										<td><%=loanNo%></td>
										<td><%=name%></td>
										<td><%=contactNo%></td>
										<td>₹<%=loanAmount%></td>
										<td><%=interest%>%</td>
										<td><%=date%></td>
										<td>₹<%=monthly%></td>
										<td>Completed</td>
										<td><a href="EditLoanServlet?id=1"
											class="btn btn-warning btn-sm">Edit</a> <a
											href="DeleteLoanServlet?id=1" class="btn btn-danger btn-sm">Delete</a>
										</td>
									</tr>
									<%
									}
									rs.close();
									ps.close();
									conn.close();
									} catch (Exception e) {
									out.print("<tr><td colspan='8'>Error loading data.</td></tr>");
									e.printStackTrace();
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
					<!-- Add Loan Button -->

					<a class="btn btn-primary mb-3" href="newLoan.jsp">Add New Loan</a>

				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS for Modal -->
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