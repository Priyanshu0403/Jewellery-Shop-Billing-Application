<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer purchase</title>
	<link href="bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link href="navbar.css" rel="stylesheet">
    <link href="sideBarDropDownMenu.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
    
    <style>
	body {
            
            background-image: url('BackGroundImg.jpg');
            background-size:cover;
            background-position: center;
            background-attachment:fixed;		
            color: white;
        }
    .overlay {
            background-color: rgba(0, 0, 0, 0.6 );
            position: fixed;
            top: 0;
            left: 0;
            width : 100%;
            height: 100%;
        }
        
        .middlePart{
			display:flex;
		}
        
 	  .content {
            position: relative;
           	z-index:2;
            text-align: center;
            padding-top: 2vh;
        } 
        
        	/* SIDE BAR STYLING */
        
        .row .col-md-2{
			box-shadow: 0px 10px 10px #B98522;
			height: 100px;
		}

		.list-group a{
			background-color: transparent;
			color: white;
			height: 50px; 
		}
        
		.list-group .active{
			color: #B98522;
			background-color:transparent !important; 
			border:0;
			font-size: x-large;
		}
		
			
		
		/*  side bar Styling end*/
		
		form{
			color:black;
		}
 </style> 
</head>
<body>
<div class="overlay"></div>
<%@include file="navbar.html" %>

<div class="middlePart">
 <%@include file="sideBarDropDownMenu.html" %> 
<div class="container-fluid " style="margin-top:80px;padding-left:250px;" >
	<div class="row">
		
		<div class="col col-md-12 pt-1 d-flex flex-column align-items-center " style="z-index:2;">
    
        	<h3 class="mb-1 text-center">Add Customer Purchase</h3>        	
			<div class="content ">
				<div class="container ">
        			<form action="addCustomerPurchase" method="post" class="shadow p-4 bg-light rounded"
        				style="width:600px"
        			>
        			
            			
						<div class="row">
						<div class="col-md-6 mb-2">
                    			<label class="form-label">Id</label>
                    			<input type="number" class="form-control" name="id" required>
                		</div>
                			
            			<div class=" col-md-6 mb-2">
                			<label class="form-label">Customer Name</label>
                			<input type="text" class="form-control" name="name"  required>
            			</div>
            			<div class="col-md-3 mb-2 ">
            			</div>
            			<div class="col-md-6 mb-2 ">
                			<label class="form-label">Contact Number</label>
                			<input type="text" class="form-control" name="number" required>
            			</div>
            			
            			</div>
						<hr style="color: black">
						
						
						<a class="btn btn-primary" href="#newItem"">Add Item</a>
						 <br>
						<h6>Item 1</h6>
						
            			<div class="row">
						

            			<div class=" col-md-6 mb-2">
                			<label class="form-label">Item Name</label>
                			<input type="text" class="form-control" name="itemName"  required>
            			</div>
            			

            			
                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Quantity</label>
                    			<input type="number" class="form-control" name="quantity"  required>
                			</div>

                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Weight (in grams)</label>
                    			<input type="number" step="0.01" class="form-control" name="weight"  required>
                			</div>
            			

            			
                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Price (₹)</label>
                    			<input type="number" class="form-control" name="price" required>
							</div>
            				
            			</div>
            			
            			
            			
            			<hr style="color: black">
            			
            			<h6>Item 2</h6>
            			<div class="row" id="newItem">
						

            			<!-- <div class=" col-md-6 mb-2">
                			<label class="form-label">Item Name</label>
                			<input type="text" class="form-control" name="itemName"  required>
            			</div>
            			

            			
                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Quantity</label>
                    			<input type="number" class="form-control" name="quantity"  required>
                			</div>

                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Weight (in grams)</label>
                    			<input type="number" step="0.01" class="form-control" name="weight"  required>
                			</div>
            			

            			
                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Price (₹)</label>
                    			<input type="number" class="form-control" name="price" required>
                			</div> -->

                			
            				
            			</div>
						
						<hr style="color: black">
						<div class="row" >
						<div class="col-md-6 mb-2">
                    			<label class="form-label">Total (₹)</label>
                    			<input type="number" class="form-control" readonly>
                			</div>
            				<%
    							java.time.LocalDate todayDate = java.time.LocalDate.now();
							%>
							<div class="col-md-6 mb-2">
								<label class="form-label">Date of Purchase</label>
                				<input type="date" class="form-control" name="date" value="<%= todayDate %>" required>
							</div>
            				<div class="col-md-6 mb-2 ">
                				<label class="form-label">Amt. Paid</label>
                				<input type="number" class="form-control" name="paid" required>
            				</div>
            				<div class="col-md-6 mb-2">
								<label class="form-label">Due Amt.</label>
                				<input type="number" class="form-control" readonly>
							</div>
						</div>
						
            			<div class="row d-flex justify-content-center gap-3 ">
            				
                				<a href="addCustomerPurchase.jsp" class="col col-4 btn btn-danger">Cancel</a>
                				<button type="submit" class="col col-4 btn btn-success">Add Purchase</button>
                				<a href="displayList" class="col col-4 btn btn-primary">Show Customer List</a>
                			
            			</div>
        			</form>
    			</div>
			</div>
		</div>
	</div>
</div>
</div>

	
        
        
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		
</body>
</html>