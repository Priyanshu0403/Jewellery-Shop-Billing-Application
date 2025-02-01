<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Bills</title>
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
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        
        tbody{
            color: white;
        }
        
        .container {
        	position: relative;
            z-index: 2;
            margin-top: 30px;
            display:flex;
            flex-direction:column;
            align-items: center;
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
		} */
		
		/*  side bar Styling end*/
    </style>
</head>
<body>
    <div class="overlay"></div>
    <!-- Navbar -->
     <%@include file="navbar.html" %>
   	<div class="container-fluid mt-1">
    <div class="row">
			<%@include file="sideBarDropDownMenu.html" %>
				
			<div class="col col-md-10 pt-1" style="z-index:2;">
            	<h2 class="mb-4">List of Bills</h2>
            	<div class="content">
    				<div class="container">
            
            <!-- Bill Table -->
            <div class="table-responsive w-100">
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
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>John Doe</td>
                            <td>₹15,000</td>
                            <td>2025-01-25</td>
                            <td><button class="btn btn-sm btn-primary">View</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Jane Smith</td>
                            <td>₹20,000</td>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

