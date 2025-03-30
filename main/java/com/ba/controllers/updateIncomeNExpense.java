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

@WebServlet("/updateIncomeNExpenseData")
public class updateIncomeNExpense extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer uid = Integer.parseInt(req.getParameter("id"));
		LocalDate udate = LocalDate.parse(req.getParameter("date"));
		String utype = req.getParameter("type");
		Double uamount = Double.parseDouble(req.getParameter("amount"));
		String ucategory = req.getParameter("category");
		String udesc = req.getParameter("description");
		
		try {
			Connection conn = connectDB.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("UPDATE income_n_expense SET Date=?,Type=?,Amount=?,Category=?,Description=? WHERE Id=?");
			
			ps.setDate(1, java.sql.Date.valueOf(udate));
			ps.setString(2, utype);
			ps.setDouble(3, uamount);
			ps.setString(4, ucategory);
			ps.setString(5, udesc);
			ps.setInt(6, uid);
			
			int count = ps.executeUpdate();
			
			if (count>0) {
				RequestDispatcher rd = req.getRequestDispatcher("/editIncomeNExpense.jsp");
				rd.include(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("/editIncomeNExpense.jsp");
				rd.include(req, resp);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}