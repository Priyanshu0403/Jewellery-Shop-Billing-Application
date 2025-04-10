package com.ba.controllers;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import com.ba.dao.connectDB;

public class PurchaseDAO {
	public void addPurchase(int customerId, String itemName, int quantity, double weight, double price,
			LocalDate date) {
		String query = "INSERT INTO customer_purchases (customer_id, item_name, quantity, weight, price, total, purchase_date) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = connectDB.getConnection(); 
			PreparedStatement ps = conn.prepareStatement(query)) {

			double total = quantity * price;

			ps.setInt(1, customerId);
			ps.setString(2, itemName);
			ps.setInt(3, quantity);
			ps.setDouble(4, weight);
			ps.setDouble(5, price);
			ps.setDouble(6, total);
			ps.setDate(7, java.sql.Date.valueOf(date));

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
