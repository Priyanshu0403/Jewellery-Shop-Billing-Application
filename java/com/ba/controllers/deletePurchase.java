package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ba.dao.connectDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletePurchase")
public class deletePurchase extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer customerId = Integer.parseInt(req.getParameter("customer_id"));

		Integer purchaseId = Integer.parseInt(req.getParameter("purchase_id"));
		try {

			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE FROM customer_purchases WHERE purchase_id=?");
			ps.setInt(1, purchaseId);
			ps.executeUpdate();

			resp.sendRedirect("customerPurchases.jsp?customer_id="+ customerId);

		} catch (Exception e) {
			e.printStackTrace();
			resp.getWriter().println("Error deleting purchase.");
		}
	}
}
