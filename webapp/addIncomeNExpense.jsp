<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            background-color: rgba(0, 0, 0, 0.6 );
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
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
			/* height: 70px; */
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
    <div class="container-fluid mt-1">
    	<div class="row">
    			
			<%@include file="sideBarDropDownMenu.html" %>
            	<div class="col col-md-10 pt-1 d-flex flex-column align-items-center " style="z-index:2;">
                  	<h3 class="mb-1 text-center">Add New Entry</h3>
                    <div class="content">
							<div class="container">  
                            	<form action="addIncomeNExpenseData" method="post"  class="shadow p-4 bg-light rounded" style="width:500px">
                                	<div class="mb-3">
                                    	<label for="entryDate" class="form-label">Date</label>
                                    	<input type="date" class="form-control" name="date" id="entryDate" required>
                                	</div>
                                	<div class="mb-3">
                                    	<label for="entryType" class="form-label">Type</label>
                                    	<select class="form-select" name="type" id="entryType">
                                        	<option value="income">Income</option>
                                        	<option value="expense">Expense</option>
                                    	</select>
                                	</div>
                                	<div class="mb-3">
                                    	<label for="amount" class="form-label">Amount (₹)</label>
                                    	<input type="number" class="form-control" name="amount" id="amount" required>
                                	</div>
                                	<div class="mb-3">
                                    	<label for="description" class="form-label">Description</label>
                                    	<input type="text" class="form-control" name="description" id="description" required>
                                	</div>
									<div class="row d-flex justify-content-center gap-3 ">
            				
                						<a href="addIncomeNExpense.jsp" class="col col-5 btn btn-danger">Cancel</a>
                						<button type="submit" class="col col-5 btn btn-success">Add Income/Expense</button>
                						<a href="incomeNexpense.jsp" class="col col-6 btn btn-primary">Show Income/Expense List</a>
                			
            						</div>
            					</form>
                            	
           					</div> 
           				</div> 
           			</div> 
           		</div> 
           	</div> 
                        
   	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>