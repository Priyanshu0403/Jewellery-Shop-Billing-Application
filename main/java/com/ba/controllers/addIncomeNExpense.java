package com.ba.controllers;

import java.io.IOException;
import java.math.BigInteger;
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

@WebServlet("/addIncomeNExpenseData")
public class addIncomeNExpense extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userDate = req.getParameter("date");
		LocalDate uDate = LocalDate.parse(userDate);
		
		String uType = req.getParameter("type");
		
		Double uAmount =Double.parseDouble(req.getParameter("amount"));
		
		String uCategory = req.getParameter("category");
		
		String uDesc= req.getParameter("description");
		
		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO income_N_expense( Date, Type , Amount ,Category , Description) VALUES(?,?,?,?,?) ");
			
			ps.setDate(1,java.sql.Date.valueOf(uDate));
			ps.setString(2, uType);
			ps.setDouble(3, uAmount);
			ps.setString(4,uCategory);
			ps.setString(5, uDesc);
			
			int count=ps.executeUpdate();
			
			if(count>0) {
				RequestDispatcher rd = req.getRequestDispatcher("addIncomeNExpense.jsp");
				System.out.println("income N Expense data successfully added");
				rd.include(req, resp);
				
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("addIncomeNExpense.jsp");
				System.out.println("income N Expense data not added");
				rd.include(req, resp);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}