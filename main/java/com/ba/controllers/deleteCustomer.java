package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ba.dao.connectDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteCustomer")
public class deleteCustomer extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));//this ID came from customerPurchase.jsp in which java code is used
		try {
			Connection conn = connectDB.getConnection();
			
			// Delete purchases first to avoid foreign key constraint errors
			PreparedStatement ps1 = conn.prepareStatement("DELETE FROM customer_purchases WHERE customer_id=?");
			ps1.setInt(1, id);
			ps1.executeUpdate();

			// Then delete customer
			PreparedStatement ps2 = conn.prepareStatement("DELETE FROM customer_detail WHERE customer_id=?");
			ps2.setInt(1, id);
			ps2.executeUpdate();

			resp.sendRedirect("view_customers.jsp");
			
			}catch (Exception e) {
				e.printStackTrace();
			}
	}
}
