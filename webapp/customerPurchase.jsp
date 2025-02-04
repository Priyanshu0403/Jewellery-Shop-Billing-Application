<%@page import="java.util.List" %>
<%@page import="com.ba.model.customerInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Customer Purchase Details</title>
	<link href="bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link href="navbar.css" rel="stylesheet">
    <link href="sideBarDropDownMenu.css" rel="stylesheet">
<style>
	body {
            
            background-image: url('BackGroundImg.jpg');
            background-size:cover;
            background-position: center;		
            color: white;
        }
  	
  	table{
  		background-color:transparent;
  		color:white;
  		/* border-radius: 100px; */
  		
  	}
       
   th{
   		color:white;
   	}
   	td{
   		color:white;
   	} 
   	
        
 	.overlay {
            background-color: rgba(0, 0, 0, 0.6 );
            position:fixed;/* due to this the overlay class now gets applied to the entire page and  not only the visible part of the screen */
            top: 0;
            left: 0;
            width : 100%;
            height: 100%;
        }
        
 	  .content {
            position: relative;
           	z-index:2;
            text-align: center;
            padding-top: 2vh;
        } 
        
       	.modal .fade{
       		z-index:2;
       	}
       	
       	.modal{
       		color:black;
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
				<h2 class="ms-3">Customer Purchase Details</h2>
			
				<!-- here model file data imported in which the data from the database is present from the above displayList.java class -->
				
				<div class="content">
					<div class="container">
						
					<!-- Display Customer List -->
						<!-- <form class="text-center" action="displayList" method="GET">
   	 						<button  class="btn btn-success" type="submit">Show/Refresh Customer List</button>
						</form>
						<br>  -->
						
						<!--         <h2 class="text-center">Customer Purchase Details</h2>
 -->        <!-- Table to display customer purchases -->
        				<table class="table table-bordered table-striped">
            				<thead class="table-dark">
                				<tr>
                    				<th>Purchase ID</th>
                    				<th>Customer Name</th>
                    				<th>Contact Number</th>
                    				<th>Item Name</th>
                    				<th>Quantity</th>
                    				<th>Weight(in gram)</th>
                    				<th>Price</th>
                    				<th>Total</th>
                    				<th>Date</th>
                    				<th>Action</th>
                				</tr>
            				</thead>
            				<%
				 			List<customerInfo> cust1 =(List<customerInfo>) session.getAttribute("cst_list");
				 			if(cust1 != null && !cust1.isEmpty()){	
							%>
            				<% for(customerInfo cust2:cust1){  %>
            				<tbody>
                				<tr>
                    				<td scope="row"><%= cust2.getID() %></td>
                    				<td><%= cust2.getCUSTOMERNAME() %></td>
                    				<td><%= cust2.getCONTACTNUMBER() %></td>
                    				<td><%= cust2.getITEMNAME() %></td>
                    				<td><%= cust2.getQUANTITY() %></td>
                    				<td><%= cust2.getWEIGHT() %></td>
                    				<td><%= cust2.getPRICE() %></td>
                    				<td><%= cust2.getTOTAL() %></td>
                    				<td><%= cust2.getDATE() %></td>
                    				<td><a href="editCustomerData?ID=<%= cust2.getID() %>" class="btn btn-warning btn-sm" >Edit</a>
                    				<!-- here ID is a variable declared for storing the id fetched from getID method -->
                    				<a href="deleteCustomerData?ID=<%= cust2.getID() %>" class="btn btn-danger btn-sm">Delete</a></td>
                				</tr>
            				</tbody>
            				<% } } %>
        				</table>


						<!-- <div class="text-center">
            				<button class="btn btn-success" data-bs-target="addDataToModal">Show Student List</button>
        				</div> -->
						
						 <!-- Add Purchase Button -->
        				<div class="text-center">
            				<a href="addCustomerPurchase.jsp" class="btn btn-primary"  >Add New Purchase</a>
        				</div>

        
        			</div>
				</div>
				
			</div>
		</div>
			</div>
		
	<!-- </div> -->
	
        	
        	<!--  Modal for Editing Customer Purchase 	
        		<div class="modal fade" id="editCustomerData" tabindex="-1" aria-labelledby="addPurchaseModalLabel" aria-hidden="true" >
            		<div class="modal-dialog">
                		<div class="modal-content">
                    		<div class="modal-header">
                        		<h5 class="modal-title" id="addPurchaseModalLabel">Edit Purchase</h5>
                        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    		</div>
                    		<div class="modal-body" >
                        		<form action="purchase" method="post"  >
                            		<div class="mb-3">
                                		<label for="customerName" class="form-label">Customer Name</label>
                                		<input type="text" class="form-control" id="customerName" name="name" required>
                            		</div>
                            		<div class="mb-3">
                                		<label for="contact" class="form-label">Contact Number</label>
                                		<input type="text" class="form-control" id="contact" name="number" required>
                            		</div>
                            		<div class="mb-3">
                                		<label for="itemName" class="form-label">Item Name</label>
                                		<input type="text" class="form-control" id="itemName" name="itemName" required>
                            		</div>
                            		<div class="mb-3">
                                		<label for="quantity" class="form-label">Quantity</label>
                                		<input type="number" class="form-control" id="quantity" name="quantity" required>
                            		</div>
                            		
                            		<div class="mb-3">
                                		<label for="weight" class="form-label">Weight(in grams)</label>
                                		<input type="number" step="0.01" class="form-control" id="weight" name="weight" required>
                            		</div>
                            		<div class="mb-3">
                                		<label for="price" class="form-label">Price (₹)</label>
                                		<input type="number" class="form-control" id="price" name="price" required>
                            		</div>
                            		<div class="mb-3">
                                		<label for="total" class="form-label">Total (₹)</label>
                                		<input type="number" class="form-control" id="total" readonly>
                            		</div>
                            		 this value is calculated in the database using below query
                            		total_amount DECIMAL(10,2) GENERATED ALWAYS AS (quantity * price_per_unit) STORED,
                            		
                            		<div class="mb-3">
                                		<label for="purchaseDate" class="form-label">Date of Purchase</label>
                                		<input type="date" class="form-control" id="purchaseDate" name="date" required>
                            		</div>
                            		<button type="submit" class="btn btn-primary">Add Purchase</button>
                        		</form>
                    		</div>
                		</div>
            		</div>
        		</div>
	 -->
	
	
		    
	<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script> -->
	<script src="bootstrap.bundle.min.js"></script>
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