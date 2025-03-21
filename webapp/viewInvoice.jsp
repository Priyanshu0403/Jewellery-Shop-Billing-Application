<%@ page import="java.util.List" %>
<%@ page import="com.ba.model.customerInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	body{
		width:100%;
		display:flex;
		flex-direction:column;
		background-image:url(BackGroundImg.jpg);
        background-size: cover;
        background-position: center;
        background-attachment:fixed;
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
</style>
</head>
<body>
<div class="overlay"></div>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color:transparent;"> <!-- bg-dark -->
        <div class="container-fluid">
        	<img alt="" src="AppLogo.png" style="width:60px;height:60px;">
            <a class="navbar-brand" href="#" >MANIKARNIKA JEWELLERS</a>
          
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto me-3">
                	<li class="nav-item">
                        
            				<button class="btn btn-primary me-2" onclick="window.print();">Print Bill</button>
            		</li>
            		<li class="nav-item me-1">
            				<button class="btn btn-success me-2" onclick="downloadBill()">Download Bill</button>
                       
                    </li>
                    <li class="nav-item">
    					<a href="invoice.jsp" class="btn btn-link text-white" style="text-decoration: none;width:35px;height:35px;"><h5>x</h5></a>
					</li>
                </ul>
            </div>
        </div>
    </nav>
    
    
    
    
					<div class="middlePart ">
							 <%
						customerInfo cst3 = (customerInfo) session.getAttribute("view_invoice");
						
					
							%> 
   							<div class="container-fluid w-50 "  style="margin-top:80px;">
            					<div class="row 1" >
									<div class="col col-md-12 " style="z-index:2;border-left: 15px  solid #fbc06a;border-right: 15px  solid #fbc06a;border-top: 15px  solid #fbc06a;border-bottom: 5px  solid #fbc06a;
				 					padding: 10px;background: #f9f9f9;border-radius: 0px; ">
                						<div class="header d-flex flex-col ">
                							<img  alt="" src="AppLogo.png" style="width:100px;height:100px">
                							<div class="Text pt-3">
            									<h3 class="mb-1" >
            										MANIKARNIKA JEWELLERS
            									</h3>
            									<p class="subheading ">Crafting Elegance, One Jewel at a Time</p>
            								</div>
            								<div class="BillNoInfo pt-4">
            									<p>Invoice Number  <%= cst3.getID() %> </p>
            									<p>Invoice Number 5674</p>
            									<p>Invoice Number 5674</p>
            									<p>Invoice Number 5674</p>
            								</div>
            
                						</div>
                	
                	            		<img class="w-100" src="line_divider.png" alt="divider-image">
                	
            							<div class="mb-3">
                							<strong>Customer Name:</strong> <%= cst3.getCUSTOMERNAME() %> 
            							</div>
            							<div class="mb-3">
                							<strong>Contact Number:</strong>  <%= cst3.getCONTACTNUMBER() %> 
            							</div>
            							<div class="mb-3">
                							<strong>Date of Purchase:</strong>  <%= cst3.getDATE() %> 
            							</div>

            							<table class="table ">
                							<thead >
                    							<tr>
                        							<th>Item Name</th>
                        							<th>Quantity</th>
                        							<th>Weight (g)</th>
                        							<th>Price (&#8377;)</th>
                        							<th>Total (&#8377;)</th>
                    							</tr>
                							</thead>
                							<tbody >
                    							<tr>
                        							<td><%= cst3.getITEMNAME() %></td>
                        							<td><%= cst3.getQUANTITY() %></td>
                        							<td><%= cst3.getWEIGHT() %></td>
                        							<td>&#8377; <%= cst3.getPRICE() %></td>
                        							<td>&#8377; <%= cst3.getTOTAL() %></td>
                    							</tr>
                							</tbody>
            							</table>

            							<div class="text-end mb-4">
                							<h5><strong>Grand Total: &#8377; ?0000</strong></h5>
            							</div>
            						</div>
								</div>	
		
		
								<div class="row 2">
									<div class="col col-md-12 " style="z-index:2;padding: 20px;background: #f9f9f9;border-left: 15px  solid #fbc06a;border-right: 15px  solid #fbc06a;border-bottom: 15px  solid #fbc06a;border-radius: 0px; ">
										<h6>PAYMENT DETAILS</h6>
				
										<p>Payment is due in 14 days from the date of issue on (date(July 17 2025)). Bank account for payment 1241-124-124.
											Payment can be made via credit card or PayPal. Please include yout invoice number.</p>
					
										<h3>Thank You!</h3>
									</div>
								</div>
							</div>
							
         				</div>
         				
         			
	    		<!-- //modal for creating a bill -->
    		<%-- 
    		
    		<div class="modal fade w-100" id="viewBill" tabindex="-1" aria-labelledby="generateInvoiceModalLabel" aria-hidden="true">
                <div class="modal-dialog " >
                    <div class="modal-content text-dark" style=" width:600px">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                       
                        <!-- Included UI of the bill -->
                        
                        <%@include file="viewBill.html" %>

						
	 

                		
                  	</div>
                </div>
            </div>
	
	 --%>
	 
	 <script src="bootstrap.bundle.min.js"></script>
</body>
</html>