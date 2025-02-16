package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet("/displayInvoiceData")
public class customerInvoiceData extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<customerInfo> c1 = new ArrayList<customerInfo>();
		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM customerpurchase");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				customerInfo cst1 = new customerInfo();
				cst1.setID(rs.getInt("purchase_id"));
				cst1.setCUSTOMERNAME(rs.getString("customer_name"));
				
				cst1.setTOTAL(rs.getDouble("total_amount"));
				cst1.setDATE(rs.getDate("purchase_date"));
				c1.add(cst1);
			}
			
			
			HttpSession sess = req.getSession();
			sess.setAttribute("invoice_list", c1);
			
			RequestDispatcher rd = req.getRequestDispatcher("/invoice.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
