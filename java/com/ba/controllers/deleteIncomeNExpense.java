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

@WebServlet("/deleteIncomeNExpense")
public class deleteIncomeNExpense extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("ID"));
		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE FROM income_n_expense WHERE Id=?");
			ps.setInt(1, id);
			int count=ps.executeUpdate();
			
			if(count>0) {
				RequestDispatcher rd = req.getRequestDispatcher("/displayIncomeNExpenseList");
				rd.forward(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("incomeNExpense.jsp");
				rd.forward(req, resp);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
