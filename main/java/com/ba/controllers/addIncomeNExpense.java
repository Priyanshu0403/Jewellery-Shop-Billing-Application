package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import com.ba.dao.connectDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addIncomeNExpenseData")
public class addIncomeNExpense extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userDate = req.getParameter("date");
		LocalDate uDate = LocalDate.parse("userDate");
		
		String uType = req.getParameter("type");
		
		Integer uAmount = Integer.parseInt(req.getParameter("amount"));
		
		String uDesc= req.getParameter("description");
		
		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO incomeNexpense(Date, Type , Amount , Description) VALUES(?,?,?,?) ");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
