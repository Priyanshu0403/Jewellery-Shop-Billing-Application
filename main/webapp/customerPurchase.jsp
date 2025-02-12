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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">

<style>
	body {
            
            background-image: url('BackGroundImg.jpg');
            background-size:cover;
            background-position: center;
            background-attachment:fixed;		
            color: white;
        }
  	
  	table{
  		background-color:transparent;
  		color:white;
  		/* border-radius: 100px; */
  		
  	}
    .middlePart{
			display:flex;
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
			height: 50px; 
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
	<div class="middlePart">
    <%@include file="sideBarDropDownMenu.html" %>
	<div class="container-fluid" style="margin-top:80px;padding-left:230px;">
	   <div class="row">
			<div class="col col-md-12 pt-1" style="z-index:2;">
			
				<h2 class="ms-3"> <i class="fa-solid fa-users"></i> Customer Purchase Details</h2>
			
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
				 			List<customerInfo> cust1 =(List<customerInfo>) session.getAttribute("cst_list");
				 			if(cust1 != null && !cust1.isEmpty()){	
								for(customerInfo cust2:cust1){ 
							%>
            				<tbody>
                				<tr>
                    				<td scope="row"><%= cust2.getID() %></td>
                    				<td><%= cust2.getCUSTOMERNAME() %></td>
                    				<td><%= cust2.getCONTACTNUMBER() %></td>
                    				<td><%= cust2.getITEMNAME() %></td>
                    				<td><%= cust2.getQUANTITY() %></td>
                    				<td><%= cust2.getWEIGHT() %> g</td>
                    				<td>₹ <%= cust2.getPRICE() %></td><!-- Ctrl + Alt + 4  for rupee symbol -->
                    				<td>₹ <%= cust2.getTOTAL() %></td>
                    				<td><%= cust2.getDATE() %></td>
                    				<td><%= cust2.getAMOUNTPAID() %></td>
                    				<td><%= cust2.getDUEAMOUNT() %></td>                    				
                    				<td><a href="editCustomerData?ID=<%= cust2.getID() %>" class="btn btn-warning btn-sm" >Edit <i class="fa-solid fa-pen-to-square"></i></a>
                    				<!-- here ID is a variable declared for storing the id fetched from getID method -->
                    				<a href="deleteCustomerData?ID=<%= cust2.getID() %>" class="btn btn-danger btn-sm">Delete <i class="fa-solid fa-trash-can"></i></a></td>
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
		</div>
	
		    
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