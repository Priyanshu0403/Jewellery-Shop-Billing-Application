package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.ba.dao.connectDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/recentPurchase")
public class recentPurchase extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<String[]> purchase = new ArrayList<>();
		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT purchase_id , customer_name , total_amount, purchase_date FROM customerpurchase ORDER BY purchase_date DESC LIMIT 5");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
