package com.ba.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addCustomerDetails")
public class addCustomerDetails extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uName = req.getParameter("name");
		String uNumber = req.getParameter("number");
		String uEmail = req.getParameter("email");
		String uGender = req.getParameter("gender");

		// here customerDAO class is called which actually stores the data in the
		// database using the query
		CustomerDAO customerDAO = new CustomerDAO();
		// below when addCustomer function is called then it returns the customerId
		// which is stored here in variable customerId
		int customerId = customerDAO.addCustomer(uName, uNumber, uEmail, uGender);
		
		
		
		//debugging******************************
		if (customerId == -1) {
		    resp.getWriter().println("Error: Customer could not be added!");
		    return;
		}
		System.out.println("New Customer ID: " + customerId);
		//***************************************
		
		
		
		
		// after customer details data is stored in the database the user gets
		// redirected to the purchased item page
		resp.sendRedirect("addPurchaseDetails.jsp?customer_id=" + customerId);
	}
}
