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

@WebServlet("/deleteCustomerData")
public class deleteCustomerData extends HttpServlet {
//	here doGet is necessary
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("ID"));//this ID came from customerPurchase.jsp in which java code is used
		try {
			Connection conn = connectDB.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("DELETE FROM customerpurchase WHERE purchase_id=?");
			ps.setInt(1, id);
			
			int count = ps.executeUpdate();
			
			if(count>0) {
				RequestDispatcher rd = req.getRequestDispatcher("/displayList");//always use backslash here
				rd.forward(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("/customerPurchase.jsp");
				rd.forward(req, resp);
			}
			
			}catch (Exception e) {
				e.printStackTrace();
			}
	}
}
