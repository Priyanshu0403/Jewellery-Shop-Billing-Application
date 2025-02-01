<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Management</title>
    <link href="bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link href="navbar.css" rel="stylesheet">
    <link href="sideBarDropDownMenu.css" rel="stylesheet">
    
    <style>
        body {
            background-image: url('BackGroundImg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
        }
        .container {
        	position: relative;
            z-index: 2;
            margin-top: 30px;
            display:flex;
            flex-direction:column;
            align-items: center;
        }
        
        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        
        .fade{
            color: black;
            text-align: center;
        }
        
        /* SIDE BAR STYLING */
        
        .row .col-md-2{
			box-shadow: 0px 10px 10px #B98522;
		}

		.list-group a{
			background-color: transparent;
			color: white;
			height: 70px;
		}
        
		.list-group .active{
			color: #B98522;
			background-color:transparent !important; 
			border:0;
			font-size: x-large;
		}
		
		/*  side bar Styling end*/
    </style>
</head>
<body>
	<div class="overlay"></div>
	
		<%@include file="navbar.html" %>
		<div class="container-fluid mt-1">
		<div class="row">
			<%@include file="sideBarDropDownMenu.html" %>
				
			<div class="col col-md-10 pt-1" style="z-index:2;">
				<h2 class="ms-3">Loan Management</h2>
				<div class="content">
    				<div class="container">
        <!-- Loan List -->
        				<div class="card w-100 mb-3">
            				<div class="card-header bg-dark text-white">Loan Records</div>
            				<div class="card-body">
                				<table class="table table-bordered">
                    				<thead class="table-dark">
                        				<tr>
                            <th>Customer Name</th>
                            <th>Amount (₹)</th>
                            <th>Interest (%)</th>
                            <th>Start Date</th>
                            <th>Due Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        				</tr>
                    				</thead>
                    				<tbody>
                        <!-- Dynamic Loan Data -->
                       		 			<tr>
                            <td>John Doe</td>
                            <td>₹20,000</td>
                            <td>5%</td>
                            <td>2025-01-01</td>
                            <td>2025-12-31</td>
                            <td>Ongoing</td>
                            <td>
                                <a href="EditLoanServlet?id=1" class="btn btn-warning btn-sm">Edit</a>
                                <a href="DeleteLoanServlet?id=1" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        				</tr>
                        <!-- Dynamic Data will be loaded here -->
                    				</tbody>
                				</table>
            				</div>
        				</div>
         <!-- Add Loan Button -->
        					<button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addLoanModal">
            					Add New Loan
        					</button>
        
        
    				</div>
    			</div>
    		</div>
    	</div>
    	</div>

    <!-- Loan Form Modal -->
    	<div class="modal fade" id="addLoanModal" tabindex="-1" aria-labelledby="addLoanModalLabel" aria-hidden="true">
        	<div class="modal-dialog">
            	<div class="modal-content">
                	<div class="modal-header bg-primary text-white">
                    	<h5 class="modal-title" id="addLoanModalLabel">Add New Loan</h5>
                    	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                	</div>
                	<div class="modal-body">
                    	<form action="LoanServlet" method="post">
                        	<div class="mb-3">
                            	<label for="customerName" class="form-label">Customer Name</label>
                            	<input type="text" class="form-control" id="customerName" name="customerName" required>
                        	</div>
                        	<div class="mb-3">
                            <label for="loanAmount" class="form-label">Loan Amount (₹)</label>
                            <input type="number" class="form-control" id="loanAmount" name="loanAmount" required>
                        	</div>
                        	<div class="mb-3">
                            <label for="interestRate" class="form-label">Interest Rate (%)</label>
                            <input type="number" class="form-control" id="interestRate" name="interestRate" required>
                        	</div>
                        	<div class="mb-3">
                            <label for="startDate" class="form-label">Start Date</label>
                            <input type="date" class="form-control" id="startDate" name="startDate" required>
                        	</div>
                        	<div class="mb-3">
                            <label for="dueDate" class="form-label">Due Date</label>
                            <input type="date" class="form-control" id="dueDate" name="dueDate" required>
                        	</div>
                        	<div class="mb-3">
                            	<label for="loanStatus" class="form-label">Status</label>
                            	<select class="form-control" id="loanStatus" name="loanStatus">
                                	<option value="Pending">Pending</option>
                                	<option value="Ongoing">Ongoing</option>
                                	<option value="Completed">Completed</option>
                            	</select>
                        	</div>
                        	<button type="submit" class="btn btn-success">Save Loan</button>
                    	</form>
                	</div>
            	</div>
        	</div>
    	</div>	

    <!-- Bootstrap JS for Modal -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
