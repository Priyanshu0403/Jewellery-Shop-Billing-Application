<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set" %>
<%@ page import="com.ba.model.incomeNExpense_data" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Income & Expenses</title>
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
       
        
         tbody{
            color: white;
            border: 1px solid #5b5c5c;
        }
        
        .fade{
        	position: relative;
            z-index: 2;
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
    		border: 1px solid #ced2d2;
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
    
    <%@include file="navbar.html" %>
    
    <!--	
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Jewelry Billing</a>
        </div>
    </nav> -->
    
    <div class="middlePart">
    <%@include file="sideBarDropDownMenu.html" %>
	<div class="container-fluid " style="margin-top:80px;padding-left:250px;">
    <div class="row">
			<div class="col col-md-12 pt-1" style="z-index:2;">
				<div class="row">
					<div class="col col-4">
            			<h2 class="mb-4">Income & Expenses</h2>  
            		</div>
            		<div class="col col-4">
            		</div>
            		<div class="col col-4">
						<form class="d-flex" role="search">
        					<input class="form-control me-2" type="search" placeholder="Search Income / Expense" aria-label="Search">
        					<button class="btn btn-light	" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</form>
      				</div> 
      			</div>   
      			
                <h3 class="mt-1">Transaction History</h3>
           
            	<div class="content">
            	
    				<div class="table-container">
            <!-- Income & Expense Table -->
<!--             			<div class="table-responsive">      <thead> is inside .table-responsive, which has overflow: auto, making position: sticky ineffective.
 -->                			<table class="table table-bordered">
                    			<thead class="table-dark">
                        			<tr>
                        	<th>Id</th>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Category</th>
                            <th>Description</th>
                            <th>Action</th>
                        			</tr>
                    			</thead>
                    <tbody class="table-secondary">
                    <% 
                    	double totalIncome = 0;
            			double totalExpense = 0;
                    	Set<incomeNExpense_data> s1 = (Set<incomeNExpense_data>) session.getAttribute("InNEx_list");
                    	if(s1 != null && !s1.isEmpty()){
                    		for (incomeNExpense_data s2 : s1){
                    			if(s2.getTYPE().equals("Income")){  //s2.getType()==income is not allowed as in java string can't be compared using comparision operator
                    				 totalIncome += s2.getAMOUNT();
                    %>
                    
                        <tr>
                        	<td><%= s2.getID() %></td>
                            <td><%= s2.getDATE() %></td>
                            <td class="text-success"><%= s2.getTYPE()%></td>  <!--  -->
                            <td>₹ <%= s2.getAMOUNT() %></td>
                            <td><%= s2.getCATEGORY() %></td>
                            <td><%= s2.getDESCRIPTION() %></td>
                            <td>
                            	<a href="editIncomeNExpense?ID=<%= s2.getID() %>" class="btn btn-warning btn-sm">Edit <i class="fa-solid fa-pen-to-square"></i></a>
                            	<a href="deleteIncomeNExpense?ID=<%= s2.getID() %>" onclick="confirmDelete(event)" class="btn btn-danger btn-sm">Delete <i class="fa-solid fa-trash-can"></i></a>
                            </td>
                        </tr>
                        
                    
                    
                    
                    
                    <%	
                    				
                    			}else if(s2.getTYPE().equals("Expense")){
                    				totalExpense += s2.getAMOUNT();
                    			
                    %>
                    
                    
                        <tr>
                        	<td><%= s2.getID() %></td>
                            <td><%= s2.getDATE() %></td>
                            <td class="text-danger"><%= s2.getTYPE()%></td>
                            <td>₹ <%= s2.getAMOUNT() %></td>
                            <td><%= s2.getCATEGORY() %></td>
                            <td><%= s2.getDESCRIPTION() %></td>
                            <td>
                            	<a href="editIncomeNExpense?ID=<%= s2.getID() %>" class="btn btn-warning btn-sm">Edit <i class="fa-solid fa-pen-to-square"></i></a>
                            	<a href="deleteIncomeNExpense?ID=<%= s2.getID() %>" onclick="confirmDelete(event)" class="btn btn-danger btn-sm">Delete <i class="fa-solid fa-trash-can"></i></a>
                            </td>
                        </tr>
                        
                    
                    <% 			
                    			} 
                    		} 
                    	}
                    	
                    %>
                    </tbody>
                </table>  
            
            
           
            </div>
            <br>
			 <div class="text-center">
            <a href="addIncomeNExpense.jsp" type="button" class="btn btn-primary mb-4" >Add New Entry</a>
             </div>
            
			<div class="row d-flex justify-content-center align-items-center">
                        
                        <div class="col-md-3">
                            <div class="card text-white bg-success mb-3">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Total Income</h5>
           	                         <p class="card-text">₹ <%= totalIncome %></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card text-white bg-danger mb-3">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Total Expenses</h5>
                                    <p class="card-text">₹ <%= totalExpense %></p>
                                </div>
                            </div>
                        </div>
                       
                    </div>
            
        </div>
    </div>
    </div>
    </div>
      </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
		//confirm delete is a function present in Javascript 
		function confirmDelete(event){
			event.preventDefault(); // Prevent default link action
			let userConfirm = confirm("Are you sure you want to delete this record");
			//built-in JavaScript function that shows a confirmation pop-up.
			
			if(userConfirm){
				window.location.href = event.target.href; // Proceed with deletion
			}
			//event.target.href retrieves the href attribute of the clicked <a> tag.
		}
	</script>
</body>
</html>



