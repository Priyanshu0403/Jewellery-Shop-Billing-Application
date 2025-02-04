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
        
        .container {
        	position: relative;
            z-index: 2;
            margin-top: 30px;
            display:flex;
            flex-direction:column;
            align-items: center;
        }
        
         tbody{
            color: white;
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
			height: 70px;
		}
        
		/* .list-group .active{
			color: #B98522;
			background-color:transparent !important; 
			border:0;
			font-size: x-large;
		}
		 */
		/*  side bar Styling end*/
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
	<div class="container-fluid mt-1">
    <div class="row">
			<%@include file="sideBarDropDownMenu.html" %>
				
			<div class="col col-md-10 pt-1" style="z-index:2;">
            	<h2 class="mb-4">Income & Expenses</h2>        
            	<div class="content">
    				<div class="container">
            <!-- Income & Expense Table -->
            <div class="table-responsive w-100">
                <h3 class="mt-4">Transaction History</h3>
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2025-01-28</td>
                            <td class="text-success">Income</td>
                            <td>₹5,000</td>
                            <td>Gold Sale</td>
                        </tr>
                        <tr>
                            <td>2025-01-27</td>
                            <td class="text-danger">Expense</td>
                            <td>₹1,500</td>
                            <td>Shop Rent</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            
            <a href="addIncomeNExpense.jsp" type="button" class="btn btn-primary mb-4" >
                Add New Entry
            </a>
            </div>

            
        </div>
    </div>
    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



