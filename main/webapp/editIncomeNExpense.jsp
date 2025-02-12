<%@ page import="com.ba.model.incomeNExpense_data" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Income/Expense </title>
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
            background-color: rgba(0, 0, 0, 0.6 );
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
            text-align: center;
            padding-top: 2vh;
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
		} */
		

		
		
		/*  side bar Styling end*/
		
		
        /* .navbar{
        	box-shadow: 0px 1px 10px #B98522;
        }
        .navbar .navbar-brand{
        	font-family: 'Playfair Display', serif;
        	font-size: 30px;
        } */
/*         
        .btn-group{
        	width:267px;
        	box-shadow: 0px 1px 10px #B98522;
        	border-top-left-radius: 0px;
        	border-top-right-radius: 0px;
        	border:1px solid black;
        }
        
        .btn-group button{
        color:white;
        font-weight: bold;
        } */
        
        form{
			color:black;
		}
    </style>
</head>
<body>
	<div class="overlay "></div>
    <%@include file="navbar.html" %>
    
    <div class="middlePart">
    <%@include file="sideBarDropDownMenu.html" %>  <!--  --> 
    <div class="container-fluid" style="margin-top:80px;padding-left:250px;">
    	<div class="row">
    			
			
            	<div class="col col-md-12 pt-1 d-flex flex-column align-items-center " style="z-index:2;">
                  	<h3 class="mb-1 text-center">Edit Entry</h3>
                    <div class="content">
							<div class="container">  
							<% incomeNExpense_data obj1 = (incomeNExpense_data) session.getAttribute("editIncomeNExpense"); %>
							
                            	<form action="updateIncomeNExpenseData" method="post"  class="shadow p-4 bg-light rounded" style="width:500px">
                            	<div class="row">
                                	<div class="col-md-6 mb-3">
                                	
                                    	<label for="entreId" class="form-label">Id</label>
                                    	<input type="number" class="form-control" name="id" id="enterId" value="<%= obj1.getID()%>" required>
                                	</div>
                                	<div class="col-md-6 mb-3">
                                    	<label for="entryDate" class="form-label">Date</label>
                                    	<input type="date" class="form-control" name="date" id="entryDate" value="<%= obj1.getDATE()%>" required>
                                	</div>
                                </div>
                                <div class="row">
                                	<div class="col-md-6 mb-3">
                                    	<label for="entryType" class="form-label">Type</label>
                                    	<select class="form-select" name="type" id="entryType" >
                                        	<option value="Income" <%= obj1.getTYPE().equals("Income") ? "selected" : "" %>>Income</option><!-- here 
                                        		directly the expense data was not able to fetch so used equals function to make it work
                                        		 -->
                                        	<option value="Expense" <%= obj1.getTYPE().equals("Expense") ? "selected" : "" %>>Expense</option>
                                    	</select>
                                	</div>
                                	<div class="col-md-6 mb-3">
                                    	<label for="amount" class="form-label">Amount (₹)</label>
                                    	<input type="number" class="form-control" name="amount" id="amount" value="<%= obj1.getAMOUNT()%>" required>
                                	</div>
                                </div>
                                	<div class="mb-3">
                                    	<label for="entryType" class="form-label">Category</label>
                                    	<select class="form-select" name="category" id="entryType" >
                                        	<option value="Gold Sell"<%= obj1.getCATEGORY().equals("Gold Sell") ? "selected" : "" %>>Gold Sell</option>
                                        	<option value="Gold Purchase"<%= obj1.getCATEGORY().equals("Gold Purchase") ? "selected" : "" %>>Gold Purchase</option>
                                        	<option value="Loan Provided"<%= obj1.getCATEGORY().equals("Loan Provided") ? "selected" : "" %>>Loan Provided</option>
                                        	<option value="Loan income with interest"<%= obj1.getCATEGORY().equals("Loan income with interest") ? "selected" : "" %>>Loan income with interest</option>
                                        	
                                    	</select>
                                	</div>
                                	<div class="mb-3">
                                    	<label for="description" class="form-label">Description</label>
                                    	<input type="text" class="form-control" name="description" id="description" value="<%= obj1.getDESCRIPTION()%>" required>
                                	</div>
									<div class="row d-flex justify-content-center gap-3 ">
            				
                						<a href="editIncomeNExpense.jsp" class="col col-5 btn btn-danger">Cancel</a>
                						<button type="submit" class="col col-5 btn btn-success">Update Income/Expense</button>
                						<a href="displayIncomeNExpenseList" class="col col-6 btn btn-primary">Show Income/Expense List</a>
                			
            						</div>
            					</form>
            					
                            	
           					</div> 
           				</div> 
           			</div> 
           		</div> 
           	</div> 
         </div>
                        
   	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>