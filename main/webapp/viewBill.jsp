<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Bill</title>
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
            color: black;
        }
        .overlay {
            background-color: rgba(0, 0, 0, 0.6 );
            position: fixed;
            top: 0;
            left: 0;
            width : 100%;
            height: 100%;
        }
         .bill-container {
            border: 1px solid #ddd;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 8px;
            max-width: 500px;
            margin: auto;  /*giving margin as auto made the bill adjust itself in middle of the page by giving proper margin on bottom - top - left - right*/
            
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
		
		h2{
			font-family:  'Playfair Display', serif;

		}       
		
		.BillNoInfo p{
			font-size:10px;
			margin-left:50px;
			margin-bottom:0px;
		}
		
    </style>
</head>
<body>
<div class="overlay"></div>


<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color:#855e18"> <!-- bg-dark -->
        <div class="container-fluid ">
        	<img alt="" src="AppLogo.png" style="width:60px;height:60px;">
            <a class="navbar-brand" href="#" >MANIKARNIKA JEWELLERS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                <!-- <li class="nav-item">
                        <button class="btn btn-primary me-2" onclick="invoiceView.jsp">View  Bill</button>
                    </li>
                	<li class="nav-item">
                        <button class="btn btn-primary me-2" onclick="window.print();">Print Bill</button>
                    </li>
                    <li class="nav-item">
                      	<button class="btn btn-success" onclick="downloadBill()">Download Bill</button>
                        
                    </li> -->
                    <li class="nav-item">
                        <a class="nav-link active" href="adminDashboard.html">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Logout <i class="fa-solid fa-right-from-bracket"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    
    
<div class="middlePart">
	<%@include file="sideBarDropDownMenu.html" %>
   		<div class="container-fluid " style="margin-top:80px;margin-bottom:40px;padding-left:250px;">
            <div class="row 1">
				<div class="col col-md-12 " style="z-index:2;border-left: 15px  solid #fbc06a;border-right: 15px  solid #fbc06a;border-top: 15px  solid #fbc06a;border-bottom: 5px  solid #fbc06a;
				 padding: 20px;background: #f9f9f9;border-radius: 0px;max-width: 800px;margin: auto; ">
                	<div class="header d-flex flex-col ">
                		<img  alt="" src="AppLogo.png" style="width:150px;height:150px">
                		<div class="Text pt-5">
            				<h2 class="mb-2">
            					MANIKARNIKA JEWELLERS
            				</h2>
            				<p class="subheading ">Crafting Elegance, One Jewel at a Time</p>
            			</div>
            			<div class="BillNoInfo pt-5">
            				<p>Invoice Number 5674</p>
            				<p>Invoice Number 5674</p>
            				<p>Invoice Number 5674</p>
            				<p>Invoice Number 5674</p>
            			</div>
            
                	</div>
                	
                	            <img class="w-100" src="line_divider.png" alt="divider-image">
                	
            		<div class="mb-3">
                		<strong>Customer Name:</strong> John Doe
            		</div>
            		<div class="mb-3">
                <strong>Contact Number:</strong> 9876543210
            		</div>
            		<div class="mb-3">
                <strong>Date of Purchase:</strong> 2024-01-30
            		</div>

            		<table class="table ">
                		<thead >
                    		<tr>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Weight (g)</th>
                        <th>Price (₹)</th>
                        <th>Total (₹)</th>
                    		</tr>
                		</thead>
                		<tbody>
                    <tr>
                        <td>Gold Ring</td>
                        <td>1</td>
                        <td>5.5</td>
                        <td>50000</td>
                        <td>50000</td>
                    </tr>
                		</tbody>
            	</table>

            	<div class="text-end mb-4">
                	<h5><strong>Grand Total: ₹ 50000</strong></h5>
            	</div>

            	
            </div>
		</div>
		
		
		<div class="row 2">
			<div class="col col-md-12 " style="z-index:2;padding: 20px;background: #f9f9f9;border-left: 15px  solid #fbc06a;border-right: 15px  solid #fbc06a;border-bottom: 15px  solid #fbc06a;border-radius: 0px;max-width: 800px;margin: auto; ">
				<h6>PAYMENT DETAILS</h6>
				
				<p>Payment is due in 14 days from the date of issue on (date(July 17 2025)). Bank account for payment 1241-124-124.
					Payment can be made via credit card or PayPal. Please include yout invoice number.</p>
					
				<h3>Thank You!</h3>
			</div>
		</div>
		<ul>
		    <button class="btn btn-primary me-2" onclick="invoiceView.jsp">View  Bill</button>
            <button class="btn btn-primary me-2" onclick="window.print();">Print Bill</button>
            <button class="btn btn-success" onclick="downloadBill()">Download Bill</button>
                        
		</ul>
	
         </div>
         
         
	</div>
	 <script>
        function downloadBill() {
            const element = document.createElement('a');
            const billContent = document.body.innerHTML;
            const blob = new Blob([billContent], { type: 'text/html' });
            element.href = URL.createObjectURL(blob);
            element.download = 'CustomerBill.html';
            element.click();
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
