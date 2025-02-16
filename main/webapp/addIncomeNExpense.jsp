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
                  	<h3 class="mb-1 text-center">Add New Entry</h3>
                    <div class="content">
							<div class="container">  
                            	<form action="addIncomeNExpenseData" method="post"  class="shadow p-4 bg-light rounded" style="width:500px">
                            	<div class="row">
                                	<div class="col-md-6 mb-3">
                                    	<label for="entreId" class="form-label">Id</label>
                                    	<input type="number" class="form-control" name="id" id="enterId" required>
                                	</div>
                                	<div class="col-md-6 mb-3">
                                    	<label for="entryDate" class="form-label">Date</label>
                                    	<input type="date" class="form-control" name="date" id="entryDate" required>
                                	</div>
                                </div>
                                <div class="row">
                                	<div class="col-md-6 mb-3">
                                    	<label for="entryType" class="form-label">Type</label>
                                    	<select class="form-select" name="type" id="entryType">
                                    		<option value="" disabled selected>Choose Type</option>
                                        	<option value="Income">Income</option>
                                        	<option value="Expense">Expense</option>
                                    	</select>
                                	</div>
                                	<div class="col-md-6 mb-3">
                                    	<label for="amount" class="form-label">Amount (₹)</label>
                                    	<input type="number" class="form-control" name="amount" id="amount" required>
                                	</div>
                                </div>
                                	<div class="mb-3">
                                    	<label for="entryType" class="form-label">Category</label>
                                    	<select class="form-select" name="category" id="entryType">
                                    		<option value="" disabled selected>Choose a category</option>
                                        	<option value="Gold Sell">Gold Sell</option>
                                        	<option value="Gold Purchase">Gold Purchase</option>
                                        	<option value="Loan Provided">Loan Provided</option>
                                        	<option value="Loan income with interest">Loan income with interest</option>
                                        	
                                    	</select>
                                	</div>
                                	<div class="mb-3">
                                    	<label for="description" class="form-label">Description</label>
                                        <textarea class="form-control" name="description" id="description" rows="4" required></textarea>
                      
                                	</div>
									<div class="row d-flex justify-content-center gap-3 ">
            				
                						<a href="addIncomeNExpense.jsp" class="col col-5 btn btn-danger">Cancel</a>
                						<button type="submit" class="col col-5 btn btn-success">Add Income/Expense</button>
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