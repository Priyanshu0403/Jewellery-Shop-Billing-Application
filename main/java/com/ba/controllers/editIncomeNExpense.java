package com.ba.controllers;

import java.io.IOException;
import java.net.http.HttpClient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ba.dao.connectDB;
import com.ba.model.incomeNExpense_data;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editIncomeNExpense")
public class editIncomeNExpense extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int incomeNExpense_Id = Integer.parseInt(req.getParameter("ID"));
		//the id value is stored in the ID variable in incomeNexpense.jsp
		
		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM income_n_expense WHERE Id=?");
			ps.setInt(1,incomeNExpense_Id);
			ResultSet rs= ps.executeQuery();
			
			if(rs.next()) {
				incomeNExpense_data obj1 = new incomeNExpense_data();
//				/* obj1.setID(incomeNExpense_Id); */  this code fix the value of the id and can't let it update
				obj1.setID(rs.getInt("Id"));
				obj1.setDATE(rs.getDate("Date"));
				obj1.setTYPE(rs.getString("Type"));
				obj1.setAMOUNT(rs.getDouble("Amount"));
				obj1.setCATEGORY(rs.getString("Category"));
				obj1.setDESCRIPTION(rs.getString("Description"));
				
				HttpSession sess = req.getSession();
				sess.setAttribute("editIncomeNExpense", obj1);
				
				RequestDispatcher rd = req.getRequestDispatcher("/editIncomeNExpense.jsp");
				rd.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
