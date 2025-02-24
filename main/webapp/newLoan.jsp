<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Loan</title>
	<link href="bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link href="navbar.css" rel="stylesheet">
    <link href="sideBarDropDownMenu.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">

    <style>
        body{
            background-image:url(BackGroundImg.jpg);
            background-size: cover;
            background-position: center;
            background-attachment:fixed;
            color:white;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        .middlePart{
			display:flex;
		}
        .content{
            position: relative;
            z-index: 2;
            
        }

        tbody{
            color: white;
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
        
      
        
    </style>
</head>
<body>
    <div class="overlay"></div>
     <%@include file="navbar.html" %>
     
      <div class="middlePart">
    <%@include file="sideBarDropDownMenu.html" %> 
     <div class="container-fluid " style="margin-top:80px;padding-left:250px;">
    	<div class="row">	
			<div class="col col-md-12 pt-1" style="z-index:2;">
   
            	<h2 class="ms-3">New Loan</h2>
            
            <!-- Button to Open Modal -->
            
            
            <!-- Loan Table -->
            <div class="table-responsive">
                <h3 class="mt-4">Loan Records</h3>
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Customer Name</th>
                            <th>Loan Amount</th>
                            <th>Date</th>
                            <th>Due Date</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>John Doe</td>
                            <td>₹10,000</td>
                            <td>2025-01-28</td>
                            <td>2025-06-28</td>
                            <td>Gold Loan</td>
                        </tr>
                        <tr>
                            <td>Jane Smith</td>
                            <td>₹15,000</td>
                            <td>2025-01-25</td>
                            <td>2025-07-25</td>
                            <td>Silver Loan</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#addLoanModal">
                Add New Loan
            </button>
            
            
        </div>
    </div>
    </div>
    
    <!-- Modal for Adding Loan -->
            <div class="modal fade" id="addLoanModal" tabindex="-1" aria-labelledby="addLoanModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content text-dark">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addLoanModalLabel">Add New Loan</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label for="customerName" class="form-label">Customer Name</label>
                                    <input type="text" class="form-control" id="customerName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="loanAmount" class="form-label">Loan Amount (₹)</label>
                                    <input type="number" class="form-control" id="loanAmount" required>
                                </div>
                                <div class="mb-3">
                                    <label for="loanDate" class="form-label">Date</label>
                                    <input type="date" class="form-control" id="loanDate" required>
                                </div>
                                <div class="mb-3">
                                    <label for="dueDate" class="form-label">Due Date</label>
                                    <input type="date" class="form-control" id="dueDate" required>
                                </div>
                                <div class="mb-3">
                                    <label for="loanDescription" class="form-label">Description</label>
                                    <input type="text" class="form-control" id="loanDescription">
                                </div>
                                <button type="submit" class="btn btn-primary">Add Loan</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

