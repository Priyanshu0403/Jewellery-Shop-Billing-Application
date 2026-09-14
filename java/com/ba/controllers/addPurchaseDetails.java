package com.ba.controllers;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addPurchaseDetails")
public class addPurchaseDetails extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uId = Integer.parseInt(req.getParameter("customer_id"));
		String uItemName = req.getParameter("item_name");
		int uQuantity = Integer.parseInt(req.getParameter("quantity"));
		double uWeight = Double.parseDouble(req.getParameter("weight"));
		double uPrice = Double.parseDouble(req.getParameter("price"));

		String userDate = req.getParameter("date");
		LocalDate uDate = LocalDate.parse(userDate);
		// Retrieve the current item number from the session (default to 1 if notset)
		
		/*
		 * if (itemNumber == null) { itemNumber = 1; }
		*/

		HttpSession session = req.getSession();
		Integer prevCustomerId = (Integer) session.getAttribute("prev_customer_id");
		Integer itemNumber = (Integer) req.getSession().getAttribute("item_number");

		
		
		
		
		
		// Check if customer is new
		if (prevCustomerId == null || prevCustomerId != uId) {
			itemNumber = 1; // Reset item number for new customer
		} else {	
			itemNumber = (Integer) session.getAttribute("item_number");
			itemNumber = (itemNumber == null) ? 1 : itemNumber + 1; // Increment for same customer
		}

		
		
		
		
		// Store updated values in session
		session.setAttribute("prev_customer_id", uId);
		session.setAttribute("item_number", itemNumber);
		
		 System.out.println("Updated Item Number: " + itemNumber);
		 
		 
		PurchaseDAO purchaseDAO = new PurchaseDAO();
		purchaseDAO.addPurchase(uId, uItemName, uQuantity, uWeight, uPrice, uDate);

		// Increment item number for next item_name
		// after item gets added to the database
//        itemNumber++;
		req.getSession().setAttribute("item_number", itemNumber); // Update session val

		resp.sendRedirect("addPurchaseDetails.jsp?customer_id=" + uId);

	}
}
