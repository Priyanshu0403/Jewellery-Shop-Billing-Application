package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import com.ba.dao.connectDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateCustomer")
public class updateCustomer extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer uid = Integer.parseInt(req.getParameter("id"));// here no ID as the name="id" is made in the
																// editCustomerData.jsp
		String uname = req.getParameter("name");
		String ucontact = req.getParameter("contact_no");
		String uemail = req.getParameter("email");
		String ugender = req.getParameter("gender");

		try {

			Connection conn = connectDB.getConnection();

			PreparedStatement ps = conn.prepareStatement(
					"UPDATE customer_detail SET name=?, contact_no=?, email=?,gender=? WHERE customer_id=?");
			System.out.println("Working 1");

			ps.setString(1, uname);
			ps.setString(2, ucontact);
			ps.setString(3, uemail);
			ps.setString(4, ugender);
			ps.setInt(5, uid);
			ps.executeUpdate();

			resp.sendRedirect("view_customers.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.getWriter().println("Error updating customer.");
		}
	}
}
