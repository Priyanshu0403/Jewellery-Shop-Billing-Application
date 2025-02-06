<%@page import="com.ba.model.customerInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer Purchase</title>
	<link href="bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link href="navbar.css" rel="stylesheet">
    <link href="sideBarDropDownMenu.css" rel="stylesheet">
    
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
<div class="container-fluid " style="margin-top:80px;padding-left:250px;">
	<div class="row">
		<div class="col col-md-12 pt-1 d-flex flex-column align-items-center" style="z-index:2;">
    
        	<h3 class="mb-1 text-center">Edit Customer Purchase</h3>
        	
        	<%	customerInfo c1= (customerInfo) session.getAttribute("editCustomer"); %>
        	
			<div class="content">
				<div class="container">
        			<form action="updateCustomerData" method="post" class="shadow p-4 bg-light rounded" style="width:600px">
        		
						<div class="row">
						<div class="col-md-6 mb-2">
                    			<label class="form-label">Id</label>
                    			<input type="number" class="form-control" name="id" value="<%= c1.getID() %>" readonly>
                		</div>
                			
            			<div class=" col-md-6 mb-2">
                			<label class="form-label">Customer Name</label>
                			<input type="text" class="form-control" name="name" value="<%= c1.getCUSTOMERNAME() %>" required>
            			</div>
            			</div>

            			<div class="row">
						<div class="col-md-6 mb-2">
                			<label class="form-label">Contact Number</label>
                			<input type="text" class="form-control" name="number" value="<%= c1.getCONTACTNUMBER()%>" required>
            			</div>

            			<div class=" col-md-6 mb-2">
                			<label class="form-label">Item Name</label>
                			<input type="text" class="form-control" name="itemName" value="<%= c1.getITEMNAME() %>" required>
            			</div>
            			</div>

            			<div class="row">
                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Quantity</label>
                    			<input type="number" class="form-control" name="quantity" value="<%= c1.getQUANTITY() %>" required>
                			</div>

                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Weight (grams)</label>
                    			<input type="number" step="0.01" class="form-control" name="weight" value="<%= c1.getWEIGHT() %>" required>
                			</div>
            			</div>

            			<div class="row">
                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Price (₹)</label>
                    			<input type="number" class="form-control" name="price" value="<%= c1.getPRICE() %>" required>
                			</div>

                			<div class="col-md-6 mb-2">
                    			<label class="form-label">Total (₹)</label>
                    			<input type="number" class="form-control" name="total" value="<%= c1.getTOTAL() %>" readonly>
                			</div>
            			</div>
						
            			<div class="row">
							<div class="col-md-3 mb-2">
							
							</div>
            				<div class="col-md-6 mb-2 ">
                			<label class="form-label">Date of Purchase</label>
                			<input type="date" class="form-control" name="date" value="<%= c1.getDATE() %>" required>
            			</div>
            				<div class="col-md-3 mb-2">
							
							</div>
            				
            			</div>
            			
            			<div class="row d-flex justify-content-center gap-3 ">
            				
                				<a href="customerPurchase.jsp" class="col col-4 btn btn-danger">Cancel</a>
                				<button type="submit" class="col col-4 btn btn-success">Update Purchase</button>
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
