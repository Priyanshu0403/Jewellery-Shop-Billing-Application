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
        .container {
        	position: relative;
            z-index: 2;
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
            	<h2 class="mb-4">Income & Expenses</h2>        
            	<div class="content">
    				<div class="container">
            <!-- Income & Expense Table -->
            <div class="table-responsive w-100">
                <h3 class="mt-4">Transaction History</h3>
                <table class="table table-bordered">
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
                    
                    <% 
                    	Set<incomeNExpense_data> s1 = (Set<incomeNExpense_data>) session.getAttribute("InNEx_list");
                    	if(s1 != null && !s1.isEmpty()){
                    		for (incomeNExpense_data s2 : s1){
                    			if(s2.getTYPE().equals("Income")){  //s2.getType()==income is not allowed as in java string can't be compared using comparision operator
                    				
                    %>
                    <tbody>
                        <tr>
                        	<td><%= s2.getID() %></td>
                            <td><%= s2.getDATE() %></td>
                            <td class="text-success"><%= s2.getTYPE()%></td>  <!--  -->
                            <td>₹ <%= s2.getAMOUNT() %></td>
                            <td><%= s2.getCATEGORY() %></td>
                            <td><%= s2.getDESCRIPTION() %></td>
                            <td>
                            	<a href="editIncomeNExpense?ID=<%= s2.getID() %>" class="btn btn-warning btn-sm">Edit</a>
                            	<a href="deleteIncomeNExpense?ID=<%= s2.getID() %>" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                        
                    </tbody>
                    
                    
                    
                    <%	
                    				
                    			}else if(s2.getTYPE().equals("Expense")){
                    			
                    %>
                    
                    <tbody>
                        <tr>
                        	<td><%= s2.getID() %></td>
                            <td><%= s2.getDATE() %></td>
                            <td class="text-danger"><%= s2.getTYPE()%></td>
                            <td>₹ <%= s2.getAMOUNT() %></td>
                            <td><%= s2.getCATEGORY() %></td>
                            <td><%= s2.getDESCRIPTION() %></td>
                            <td>
                            	<a href="editIncomeNExpense?ID=<%= s2.getID() %>" class="btn btn-warning btn-sm">Edit</a>
                            	<a href="deleteIncomeNExpense?ID=<%= s2.getID() %>" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                        
                    </tbody>
                    <% 			
                    			} 
                    		} 
                    	}
                    	
                    %>
                </table>  
            </div>
            
            <div class="text-center">
            <a href="addIncomeNExpense.jsp" type="button" class="btn btn-primary mb-4" >Add New Entry</a>
             </div>
            
            </div>
			
			<div class="row d-flex justify-content-center align-items-center">
                        
                        <div class="col-md-3">
                            <div class="card text-white bg-success mb-3">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Total Income</h5>
                                    <p class="card-text">₹ 1,25,000</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card text-white bg-danger mb-3">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Total Expenses</h5>
                                    <p class="card-text">₹ 75,000</p>
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
</body>
</html>



