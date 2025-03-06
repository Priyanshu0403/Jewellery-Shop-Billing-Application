<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Loan</title>
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

.content {
	position: relative;
	z-index: 2;
	text-align: center;
	padding-top: 2vh;
}

tbody {
	color: white;
}

.fade {
	color: black;
	text-align: center;
}

.list-group a {
	background-color: transparent;
	color: white;
	height: 50px;
}

/* .list-group .active{
			color: #B98522;
			background-color:transparent !important; 
			border:0;
			font-size: x-large;
		}
		 */

/*  side bar Styling end*/
form {
	color: black;
}

span {
	color: red; /* to make the field mandatory */
}

.card {
	border: 1px solid black;
}

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
	border: 1px solid white;
	background-color: #2c203d;
	color: white;
}

.table th, .table td {
	min-width: 50px; /* Adjust based on content */
	min-height: 100px;
	text-align: center;
	border: 1px solid white;
}
/* table end */
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
					<!-- Button to Open Modal -->
					<div
						class="col col-md-12 pt-1 d-flex flex-column align-items-center "
						style="z-index: 2;">
						<h3 class="mb-1 text-center">Add New Loan</h3>
						<div class="content">
							<div class="container">
								<form action="addNewLoan" method="post"
									class="shadow p-4 bg-light rounded" style="width: 100%">
									<div id="loanItems">
										<div class="row">
											<div class="col-md-3 mb-3">
												<label for="entryLoanNo" class="form-label">Loan No.</label>
												<input type="number" class="form-control" name="loanNo"
													id="entryLoanNo" placeholder="Enter Loan No." required>
											</div>
											<%
											java.time.LocalDate todayDate = java.time.LocalDate.now();
											%>
											<div class="col-md-3 mb-3">
												<label for="entryLoanDate" class="form-label">Loan
													Date<span>*</span>
												</label> <input type="date" class="form-control" name="Loandate"
													id="entryLoanDate" value="<%=todayDate%>" required>
											</div>
											<div class="col-md-3 mb-3">
												<label for="entryName" class="form-label">Customer
													Name<span>*</span>
												</label> <input type="text" class="form-control" name="Name"
													id="entryName" placeholder="Enter Name" required>
											</div>
											<div class="col-md-3 mb-3">
												<label for="entryPhoneNo" class="form-label">Phone
													No.<span>*</span>
												</label> <input type="number" class="form-control" name="Number"
													id="entryPhoneNo" placeholder="Enter Phone Number" required>
											</div>
											<div class="col-md-3 mb-3">
												<label for="entryAddress" class="form-label">Address

												</label> <input type="address" class="form-control" name="address"
													id="entryAddress" placeholder="Enter Address">
											</div>

										</div>
										<div class="rows d-flex justify-content-center">
											<div class="col-md-3 ">
												<button type="button" class="btn btn-outline-success"
													onClick="addNewItem()">Add Item</button>
											</div>
										</div>
										<div class="rows">
											<div class="col-md-12 mt-3">
												<div class="card">
													<div class="card-body">
														<div class="table-container"
															style="height: 170px; display: inline-block;">
															<table class="table">
																<thead>
																	<tr>
																		<th scope="col">Item No.</th>
																		<th scope="col">Item Name</th>
																		<th scope="col">Description</th>
																		<th scope="col">Weight(in grams)</th>
																		<th scope="col">Quantity</th>
																		<th scope="col">Price</th>
																	</tr>
																</thead>
																<tbody id="loanItemsTableBody" style="color: black">
																	
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="row">
												<div class="col-md-2 mb-3">
													<label>No. of Item</label>

												</div>
												<div class="col-md-2 mb-3">
													<label>Total Quantity</label>

												</div>
												<div class="col-md-2 mb-3">
													<label>Total Grams</label>

												</div>
												<div class="col-md-2 mb-3">
													<label for="entryPrice" class="form-label">Loan
														Grand Amount (₹)</label> <input type="number" class="form-control"
														id="entryPrice" placeholder="Enter Loan to be Granted"
														required>
												</div>
												<div class="col-md-2 mb-3">
													<label for="entryPrice" class="form-label">Interest
														Percantage (₹)</label> <input type="number" class="form-control"
														id="entryPrice" placeholder="Enter Interest in %" required>
												</div>
												<div class="col-md-2 mb-3">
													<label for="entryPrice" class="form-label">Monthly
														Interest Amount (₹)</label> <input type="number"
														class="form-control" id="entryPrice" readonly>
												</div>
											</div>
										</div>
									</div>





									<!-- <div class="row">
                                	<div class="col-md-6 mb-3">
                                    	<label for="entryType" class="form-label">Type</label>
                                    	<select class="form-select" name="type" id="entryType">
                                    		<option value="" disabled selected>Choose Type</option>
                                        	<option value="Income">Income</option>
                                        	<option value="Expense">Expense</option>
                                    	</select>
                                	</div>
                                	<div class="col-md-6 mb-3">
                                    	<label for="amount" class="form-label">Amount (₹)</label>
                                    	<input type="number" class="form-control" name="amount" id="amount" required>
                                	</div>
                                </div>
                                	<div class="mb-3">
                                    	<label for="entryType" class="form-label">Category</label>
                                    	<select class="form-select" name="category" id="entryType">
                                    		<option value="" disabled selected>Choose a category</option>
                                        	<option value="Gold Sell">Gold Sell</option>
                                        	<option value="Gold Purchase">Gold Purchase</option>
                                        	<option value="Loan Provided">Loan Provided</option>
                                        	<option value="Loan income with interest">Loan income with interest</option>
                                        	
                                    	</select>
                                	</div>
                                	<div class="mb-3">
                                    	<label for="description" class="form-label">Description</label>
                                        <textarea class="form-control" name="description" id="description" rows="4" required></textarea>
                      
                                	</div>
									<div class="row d-flex justify-content-center gap-3 ">
            				
                						<a href="addIncomeNExpense.jsp" class="col col-5 btn btn-danger">Cancel</a>
                						<button type="submit" class="col col-5 btn btn-success">Add Income/Expense</button>
                						<a href="displayIncomeNExpenseList" class="col col-6 btn btn-primary">Show Income/Expense List</a>
                			
            						</div> -->
								</form>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    	function addNewItem(){
    		 // Select the table body
            let tableBody = document.getElementById("loanItemsTableBody");

            // Create a new row with input fields
            let newRow = `
                <tr>
                    <td><input type="text" class="form-control" name="itemNo[]" required></td>
                    <td><input type="text" class="form-control" name="itemName[]" required></td>
                    <td><input type="text" class="form-control" name="description[]" required></td>
                    <td><input type="number" class="form-control" name="weight[]" required></td>
                    <td><input type="number" class="form-control" name="quantity[]" required></td>
                    <td><input type="number" class="form-control" name="price[]" required></td>
                    <td><button type="button" class="btn btn-danger" onclick="removeRow(this)">Remove</button></td>
                </tr>
            `;

            // Append the new row to the table
            tableBody.insertAdjacentHTML("beforeend", newRow);
        }

        function removeRow(button) {
            // Remove the row when "Remove" button is clicked
            button.closest("tr").remove();
        }
    </script>
</body>
</html>

