
<%
// Get the item number from request parameters, default to 1 if not present

// Retrieve item number from session (default to 1 if not set)
Integer itemNumber = (Integer) session.getAttribute("item_number");
if (itemNumber == null) {
	itemNumber = 1;
}

int customerId = Integer.parseInt(request.getParameter("customer_id"));
// Get customer ID
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer purchase</title>
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

.content {
	position: relative;
	z-index: 2;
	text-align: center;
	padding-top: 2vh;
}

/* SIDE BAR STYLING */
.row .col-md-2 {
	box-shadow: 0px 10px 10px #B98522;
	height: 100px;
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
form {
	color: black;
}
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

				<div
					class="col col-md-12 pt-1 d-flex flex-column align-items-center "
					style="z-index: 2;">

					<h3 class="mb-1 text-center">Add Purchase Info</h3>

					<br>
					<p>Instructions:
					<p>
						step 1: Fill Item Details (submit the details) <br> step 2 :
						If more than 1 items purchased then again fill the ITEM Details
					</p>
					<br>
					<h4>Step 2</h4>
					<div class="content ">
						<div class="container ">


							<form action="addPurchaseDetails" method="post"
								class="shadow p-4 bg-light rounded" style="width: 600px">
								<h4>
									Item
									<%=itemNumber%></h4>
								<div class="row">
									<input type="hidden" name="customer_id" value="<%=customerId%>">
									<div class="col-md-6 mb-2">
										<label class="form-label">Item Name :</label> <input
											type="text" class="form-control" name="item_name" required>
									</div>
									<div class="col-md-6 mb-2">
										<label class="form-label">Quantity :</label> <input
											type="number" class="form-control" name="quantity" required>
									</div>
									<div class="col-md-6 mb-2">
										<label>Weight (g):</label> <input type="number"
											class="form-control" step="0.01" name="weight" required>
									</div>
									<div class="col-md-6 mb-2">
										<label>Price (₹):</label> <input type="number"
											class="form-control" step="0.01" name="price" required>
									</div>
									<div class="col-md-3 mb-2"></div>
									<%
									java.time.LocalDate todayDate = java.time.LocalDate.now();
									%>
									<div class="col-md-6 mb-2">
										<label class="form-label">Date of Purchase</label> <input
											type="date" class="form-control" name="date"
											value="<%=todayDate%>" required>
									</div>

									<div class="row d-flex justify-content-center gap-3 ">

										<a href="addPurchaseDetails.jsp"
											class="col col-4 btn btn-danger">Cancel</a>
										<button type="submit" class="col col-4 btn btn-success">Add
											Items</button>
										<!-- <a href="displayList" class="col col-6 btn btn-primary">Show
											Customer Purchase List</a> -->
										<a href="view_customers.jsp" class="col col-6 btn btn-primary">Show
											Customer Purchase List</a>
									</div>


								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
