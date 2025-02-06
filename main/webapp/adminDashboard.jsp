<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jewelry Business Billing Application</title>
	<link href="bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link href="navbar.css" rel="stylesheet">
    <link href="sideBarDropDownMenu.css" rel="stylesheet">
    
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
       /*  .content{
            position: relative;
            z-index: 2;
        } */

        tbody{
            color: white;
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
        
    </style>
</head>
<body>
    <div class="overlay "></div>
    <%@include file="navbar.html" %>
     <div class="middlePart">
    <%@include file="sideBarDropDownMenu.html" %>
    <div class="container-fluid" style="margin-top:80px;padding-left:250px;">
    	<div class="row">
				<div class="col col-md-12 pt-1" style="z-index:2;">
					<h2 class="ms-3 ">Welcome to the Admin Dashboard</h2>
	
					<!-- <div class="content">
        				<div class="row mt-3 ">

         
              		</div> -->

            <!-- Content Area -->
                	<div class="col ">
<!--                     <h2 class="mb-4">Welcome to the Admin Dashboard</h2>
 -->                    <div class="row">
                        <div class="col-md-3">
                            <div class="card text-white bg-primary mb-3">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Total Customers</h5>
                                    <p class="card-text">50</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card text-white bg-success mb-3">
                                <div class="card-body text-center">
                                    <h5 class="card-title ">Total Income</h5>
                                    <p class="card-text">&#8377; 1,25,000</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card text-white bg-danger mb-3">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Total Expenses</h5>
                                    <p class="card-text">&#8377; 75,000</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card text-white bg-warning mb-3">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Today's Opening Balance</h5>
                                    <p class="card-text">&#8377; 50,000</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
					
                    <div class="table-responsive">
                        <h3 class="mt-4">Recent Bills</h3>
                        <table class="table table-bordered">
                            <thead class="table-dark">
                                <tr>
                                    <th>Bill ID</th>
                                    <th>Customer Name</th>
                                    <th>Total Amount</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody class="table-success ">
                                <tr>
                                    <td>1</td>
                                    <td>John Doe</td>
                                    <td>&#8377; 15,000</td>
                                    <td>2025-01-25</td>
                                    <td><button class="btn btn-sm btn-primary">View</button></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Jane Smith</td>
                                    <td>&#8377; 20,000</td>
                                    <td>2025-01-24</td>
                                    <td><button class="btn btn-sm btn-primary">View</button></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Jane Smith</td>
                                    <td>&#8377; 20,000</td>
                                    <td>2025-01-24</td>
                                    <td><button class="btn btn-sm btn-primary">View</button></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Jane Smith</td>
                                    <td>&#8377; 20,000</td>
                                    <td>2025-01-24</td>
                                    <td><button class="btn btn-sm btn-primary">View</button></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Jane Smith</td>
                                    <td>&#8377; 20,000</td>
                                    <td>2025-01-24</td>
                                    <td><button class="btn btn-sm btn-primary">View</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
			</div>
		</div>

        
    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

