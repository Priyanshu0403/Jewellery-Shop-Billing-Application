<%@ page import="java.util.List" %>
<%@ page import="com.ba.model.customerInfo" %>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
   
    <style>
        body{
            background-image:url(BackGroundImg.jpg);
            background-size: cover;
            background-position: center;
            background-attachment:fixed;
            
        }
		
		tbody{
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
    	.middlePart{
			display:flex;
		}
		
    	.table-responsive tbody{
           color:white;
        }
    	
        

		/* Bill Styling */
		.BillNoInfo p{
			font-size:8px;
			margin-left:20px;
			margin-bottom:0px;
		}
		
		/* to make the table fit all the content and make it scrollable */
		.table-container {
    		max-height: 300px; /* Adjust the height as needed */
    		overflow-y: auto; /* Enable vertical scroll */
    		border: 1px solid white;
    		position: relative;
  		}
  		
  		.table thead{
    		position: sticky;
    		top: 0;
    		z-index: 1000;
  		}
  		.table th, .table td {
    		min-width:0px; /* Adjust based on content */
    		text-align: center;
		}
		/* table end */
		
</style>
</head>

<body>
    <div class="overlay"></div>
    <!-- Navbar -->
    <%@include file="navbar.html" %>
     
    <div class="middlePart">
    	<%@include file="sideBarDropDownMenu.html" %> 
   			<div class="container-fluid " style="margin-top:80px;padding-left:250px;">
    			<div class="row">
					<div class="col col-md-12 pt-1" style="z-index:2;">
   						<div class="row">
					<div class="col col-4">
            			<h2 class="mb-4" style="color:white;">Invoice Generator</h2>
            		</div>
            		<div class="col col-4">
            		</div>
            		<div class="col col-4">
						<form class="d-flex" role="search">
        					<input class="form-control me-2" type="search" placeholder="Search Customer" aria-label="Search">
        					<button class="btn btn-light	" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</form>
      				</div> 
      			</div>   
            
            

                <h3 class="mt-4" style="color:white;">Generated Invoices</h3>
			
            <!-- Invoice Table -->
            <div class="table-container">
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
                    <%
						List<customerInfo> cst1 = (List<customerInfo>)session.getAttribute("invoice_list");
						if(cst1 != null && !cst1.isEmpty()){
						for(customerInfo cst2:cst1){
					
					%>
                    <tbody>
                        <tr>
                            <td>INV<%= cst2.getID() %></td>
                            <td><%= cst2.getCUSTOMERNAME() %></td>
                            <td>₹<%= cst2.getTOTAL() %></td>
                            <td><%= cst2.getDATE() %></td>
                            <td><a class="btn btn-sm btn-primary" href="viewInvoice?ID=<%= cst2.getID() %>" >View</a></td>
                        </tr>
                        
                    </tbody>
                    <%
							}
						}
            		%>
                </table>
                
            </div>
            
            <!-- Button to Open Modal -->
            <br>
            <div class="text-center">
            	<a  type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#generateInvoiceModal" >Add New Entry</a>
             </div>
            
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
                                    <label for="invoiceId" class="form-label">Invoice Id</label>
                                    <input type="text" class="form-control" id="invoiceId" placeholder="Begin With INV" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="customerName" class="form-label">Customer Name</label>
                                    <input type="text" class="form-control" id="customerName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="contactNumber" class="form-label">Contact Number</label>
                                    <input type="number" class="form-control" id="contactNumber" required>
                                </div>
                                <div class="mb-3">
                                    <label for="itemName" class="form-label">Item Name</label>
                                    <input type="text" class="form-control" id="itemName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="quantity" class="form-label">Quantity</label>
                                    <input type="number" class="form-control" id="quantity" required>
                                </div>
                                <div class="mb-3">
                                    <label for="weight" class="form-label">Weight</label>
                                    <input type="number" class="form-control" id="weight" required>
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price</label>
                                    <input type="number" class="form-control" id="price" required>
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
    
 </div>
 
 	
    <script src="bootstrap.bundle.min.js"></script>


</body>
</html>