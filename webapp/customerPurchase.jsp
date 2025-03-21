<%@page import="java.util.List"%>
<%@page import="com.ba.model.customerInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Purchase Details</title>
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
								<i class="fa-solid fa-users"></i> Customer Purchase Details
							</h2>
						</div>
						<div class="col col-4 mt-2">
							<h5>Total Number Of Customers:</h5>
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
							<table class="table table-bordered ">
								<thead class="table-dark">
									<tr>
										<th>ID</th>
										<th>Customer Name</th>
										<th>Contact No.</th>
										<th>Item Name</th>
										<th>Qty.</th>
										<th>Weight</th>
										<th>Price</th>
										<th>Total</th>
										<th>Date</th>
										<th>Paid</th>
										<th>Due Amt.</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
								List<customerInfo> cust1 = (List<customerInfo>) session.getAttribute("cst_list");
								if (cust1 != null && !cust1.isEmpty()) {
									for (customerInfo cust2 : cust1) {
								%>
								<tbody class="table-secondary" id="tableData">
									<tr>
										<td scope="row"><%=cust2.getID()%></td>
										<td><%=cust2.getCUSTOMERNAME()%></td>
										<td><%=cust2.getCONTACTNUMBER()%></td>
										<td><%=cust2.getITEMNAME()%></td>
										<td><%=cust2.getQUANTITY()%></td>
										<td><%=cust2.getWEIGHT()%> g</td>
										<td>₹ <%=cust2.getPRICE()%></td>
										<!-- Ctrl + Alt + 4  for rupee symbol -->
										<td>₹ <%=cust2.getTOTAL()%></td>
										<td><%=cust2.getDATE()%></td>
										<td>₹ <%=cust2.getAMOUNTPAID()%></td>
										<td>₹ <%=cust2.getDUEAMOUNT()%></td> 
										<td><a href="editCustomerData?ID=<%=cust2.getID()%>"
											class="btn btn-warning btn-sm">Edit <i
												class="fa-solid fa-pen-to-square"></i></a> <!-- here ID is a variable declared for storing the id fetched from getID method -->
											<a href="deleteCustomerData?ID=<%=cust2.getID()%>"
											onclick="confirmDelete(event)" class="btn btn-danger btn-sm">Delete
												<i class="fa-solid fa-trash-can"></i>
										</a></td>
									</tr>
								</tbody>
								<%
								}
								}
								%>
							</table>
						</div>
						<br>
						<div class="text-center">
							<a href="addCustomerPurchase.jsp" class="btn btn-primary">Add
								New Purchase</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script> -->
	<script src="bootstrap.bundle.min.js"></script>

	<script>
		//confirm delete is a function present in Javascript 
		function confirmDelete(event) {
			event.preventDefault(); // Prevent default link action
			let userConfirm = confirm("Are you sure you want to delete this record");
			//built-in JavaScript function that shows a confirmation pop-up.

			if (userConfirm) {
				window.location.href = event.target.href; // Proceed with deletion
			}
			//event.target.href retrieves the href attribute of the clicked <a> tag.
		}
		
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
	<!-- <script>
        // Calculate Total when Quantity or Price changes
        document.getElementById("quantity").addEventListener("input", calculateTotal);
        document.getElementById("price").addEventListener("input", calculateTotal);

        function calculateTotal() {
            const quantity = document.getElementById("quantity").value;
            const price = document.getElementById("price").value;
            const total = quantity * price;
            document.getElementById("total").value = total;
        }
    </script> -->
</body>
</html>