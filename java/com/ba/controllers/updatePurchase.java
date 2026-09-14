package com.ba.controllers;

import java.io.IOException;
import java.sql.*;

import com.ba.dao.connectDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updatePurchase")
public class updatePurchase extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer purchaseId = Integer.parseInt(request.getParameter("purchase_id"));
		Integer customerId = Integer.parseInt(request.getParameter("customer_id"));
		String itemName = request.getParameter("item_name");
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		Double weight = Double.parseDouble(request.getParameter("weight"));
		Double price = Double.parseDouble(request.getParameter("price"));
		String date = request.getParameter("date");

		try {

			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"UPDATE customer_purchases SET item_name=?, quantity=?, weight=?, price=?, total=?, purchase_date=? WHERE purchase_id=?");
			Double total = quantity * price;
			ps.setString(1, itemName);
			ps.setInt(2, quantity);
			ps.setDouble(3, weight);
			ps.setDouble(4, price);
			ps.setDouble(5, total);
			ps.setDate(6, java.sql.Date.valueOf(date));
			ps.setInt(7, purchaseId);

			ps.executeUpdate();
			ps.close();
			conn.close();

			response.sendRedirect("customerPurchases.jsp?customer_id="+ customerId); // Redirect to purchases list

		} catch (Exception e) {
			e.printStackTrace();
			
			//this will print the output on the blank screen
			response.getWriter().println("Error updating purchase.");
		}
	}
}
