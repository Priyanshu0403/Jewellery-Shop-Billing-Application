<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.ba.model.customerInfo"%>
<%@ page import="com.ba.model.incomeNExpense_data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jewelry Business Billing Application</title>
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
	color: white;
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
/*  .content{
            position: relative;
            z-index: 2;
        } */
tbody {
	color: white;
}

/* to make the table fit all the content and make it scrollable */
.table-container {
	max-height: 300px; /* Adjust the height as needed */
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
	<div class="overlay "></div>
	<%@include file="navbar.html"%>
	<div class="middlePart">
		<%@include file="sideBarDropDownMenu.html"%>
		<div class="container-fluid" style="margin-top: 80px; padding-left: 250px;">
			<div class="row">
				<div class="col col-md-12 pt-1" style="z-index: 2;">
					<h2 class="ms-3 ">Welcome to the Admin Dashboard</h2>

					<%
					int totalCustomer = 0;
					List<customerInfo> cust1 = (List<customerInfo>) session.getAttribute("cst_list");
					if (cust1 != null && !cust1.isEmpty()) {
						for (customerInfo cust2 : cust1) {
							totalCustomer += 1;
						}
					}
					double totalIncome = 0;
					double totalExpense = 0;
					Set<incomeNExpense_data> s1 = (Set<incomeNExpense_data>) session.getAttribute("InNEx_list");
					if (s1 != null && !s1.isEmpty()) {
						for (incomeNExpense_data s2 : s1) {
							if (s2.getTYPE().equals("Income")) { //s2.getType()==income is not allowed as in java string can't be compared using comparision operator
						totalIncome += s2.getAMOUNT();

							} else if (s2.getTYPE().equals("Expense")) {
						totalExpense += s2.getAMOUNT();

							}
						}
					}
					%>

					<!-- Content Area -->
					<div class="col ">
						<!--                     <h2 class="mb-4">Welcome to the Admin Dashboard</h2>
 -->
						<div class="row">
							<div class="col-md-3">
								<div class="card text-white bg-primary mb-3">
									<div class="card-body text-center">
										<h5 class="card-title">Total Customers</h5>
										<p class="card-text"><%=totalCustomer%></p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card text-white bg-success mb-3">
									<div class="card-body text-center">
										<h5 class="card-title ">Total Income</h5>
										<p class="card-text">
											₹
											<%=totalIncome%></p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card text-white bg-danger mb-3">
									<div class="card-body text-center">
										<h5 class="card-title">Total Expenses</h5>
										<p class="card-text">
											₹
											<%=totalExpense%></p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card text-white bg-warning mb-3">
									<div class="card-body text-center">
										<h5 class="card-title">Today's Opening Balance</h5>
										<p class="card-text">
											₹
											<%=totalIncome - totalExpense%></p>
									</div>
								</div>
							</div>
						</div>




						<div class="table-responsive">
							<h3 class="mt-4">Recent Bills</h3>
							<table class="table table-bordered">
								<thead class="table-dark">
									<tr>
										<th>Bill ID</th>
										<th>Customer Name</th>
										<th>Total Amount</th>
										<th>Date</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody class="table-secondary">
									<tr>
										<td>1</td>
										<td>John Doe</td>
										<td>&#8377; 15,000</td>
										<td>2025-01-25</td>
										<td><button class="btn btn-sm btn-primary">View</button></td>
									</tr>
									<tr>
										<td>2</td>
										<td>Jane Smith</td>
										<td>&#8377; 20,000</td>
										<td>2025-01-24</td>
										<td><button class="btn btn-sm btn-primary">View</button></td>
									</tr>
									<tr>
										<td>2</td>
										<td>Jane Smith</td>
										<td>&#8377; 20,000</td>
										<td>2025-01-24</td>
										<td><button class="btn btn-sm btn-primary">View</button></td>
									</tr>
									<tr>
										<td>2</td>
										<td>Jane Smith</td>
										<td>&#8377; 20,000</td>
										<td>2025-01-24</td>
										<td><button class="btn btn-sm btn-primary">View</button></td>
									</tr>
									<tr>
										<td>2</td>
										<td>Jane Smith</td>
										<td>&#8377; 20,000</td>
										<td>2025-01-24</td>
										<td><button class="btn btn-sm btn-primary">View</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Bootstrap JS -->
	<script src="bootstrap.bundle.min.js"></script>
</body>
</html>

