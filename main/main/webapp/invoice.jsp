<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice Generator</title>
	<link href="bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link href="navbar.css" rel="stylesheet">
    <link href="sideBarDropDownMenu.css" rel="stylesheet">   
    <style>
        body{
            background-image:url(BackGroundImg.jpg);
            background-size: cover;
            background-position: center;
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
    	
    	tbody{
            color: white;
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
    <!-- Navbar -->
     <%@include file="navbar.html" %>
   	<div class="container-fluid mt-1">
    	<div class="row">
			<%@include file="sideBarDropDownMenu.html" %>
		<div class="col col-md-10 pt-1" style="z-index:2;">
   
            <h2 class="mb-4">Invoice Generator</h2>
            
            


            <!-- Invoice Table -->
            <div class="table-responsive">
                <h3 class="mt-4">Generated Invoices</h3>
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Invoice ID</th>
                            <th>Customer Name</th>
                            <th>Total Amount</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>INV001</td>
                            <td>John Doe</td>
                            <td>₹15,000</td>
                            <td>2025-01-28</td>
                            <td><button class="btn btn-sm btn-primary">View</button></td>
                        </tr>
                        <tr>
                            <td>INV002</td>
                            <td>Jane Smith</td>
                            <td>₹20,000</td>
                            <td>2025-01-25</td>
                            <td><button class="btn btn-sm btn-primary">View</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- Button to Open Modal -->
            <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#generateInvoiceModal">
                Generate New Invoice
            </button>
            
        </div>
    </div>
    </div>
    
    
            <!-- Modal for Generating Invoice -->
            <div class="modal fade" id="generateInvoiceModal" tabindex="-1" aria-labelledby="generateInvoiceModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content text-dark">
                        <div class="modal-header">
                            <h5 class="modal-title" id="generateInvoiceModalLabel">Generate Invoice</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label for="customerName" class="form-label">Customer Name</label>
                                    <input type="text" class="form-control" id="customerName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="purchaseDetails" class="form-label">Purchase Details</label>
                                    <textarea class="form-control" id="purchaseDetails" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="totalAmount" class="form-label">Total Amount (₹)</label>
                                    <input type="number" class="form-control" id="totalAmount" required>
                                </div>
                                <div class="mb-3">
                                    <label for="invoiceDate" class="form-label">Date</label>
                                    <input type="date" class="form-control" id="invoiceDate" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Generate Invoice</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>