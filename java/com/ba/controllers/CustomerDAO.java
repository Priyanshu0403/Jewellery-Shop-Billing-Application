package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.ba.dao.connectDB;
import com.ba.model.customerInfo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CustomerDAO extends HttpServlet {
	// this parameters declared in the function are related with the class in which
	// it gets called and the value of this parameters are also same as that of
	// passed during the funciton call
	public int addCustomer(String name, String contactNo, String email, String gender) {

		String query = "INSERT INTO customer_detail(name,contact_no, email , gender) VALUES(?,?,?,?)";
		int customerId = -1;
		try (Connection CONN = connectDB.getConnection();
				PreparedStatement ps = CONN.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {

			ps.setString(1, name);
			ps.setString(2, contactNo);
			ps.setString(3, email);
			ps.setString(4, gender);
			/*
			 * ps.setInt(5, uQuantity); ps.setFloat(6, uWeight); ps.setDouble(7, uPrice);
			 * ps.setDate(8, java.sql.Date.valueOf(uDate));// here direct setLocalDate
			 * function is not available ps.setDouble(9, uPaid);
			 */

			ps.executeUpdate();
			
			var rs = ps.getGeneratedKeys();
            if (rs.next()) {
                customerId = rs.getInt(1);
            }
            
			/*
			 * if (count > 0) {
			 * 
			 * RequestDispatcher rd = req.getRequestDispatcher("addCustomerPurchase.jsp");//
			 * here instead of directly System.out.println("Purchase Successful"); // going
			 * on the customer page
			 * 
			 * rd.include(req, resp);
			 * 
			 * } else {
			 * 
			 * System.out.println("Purchase UnsuccessFul"); }
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}
		return customerId;
	}
}