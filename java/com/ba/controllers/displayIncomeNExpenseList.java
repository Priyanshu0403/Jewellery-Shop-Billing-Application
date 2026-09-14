package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import com.ba.dao.connectDB;
import com.ba.model.incomeNExpense_data;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/displayIncomeNExpenseList")
public class displayIncomeNExpenseList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Set<incomeNExpense_data> set = new HashSet<incomeNExpense_data>();     //this was not refreshing the arrangement of the data
		Set<incomeNExpense_data> set = new  TreeSet<>(Comparator.comparingInt(incomeNExpense_data::getID));  
		//using treeset we can arrange the data in the ascending order of ID as we have compared Integer by getting ID from the model

		//used set collection framework because it stops duplicating the data(here maybe as id is a primary key so it won't get duplicated)
		
		double totalIncome = 0;
		double totalExpense = 0;
		
		
		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM  income_n_expense");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				incomeNExpense_data d1 = new incomeNExpense_data();
				d1.setID(rs.getInt("ID"));
				d1.setDATE(rs.getDate("Date"));
				d1.setTYPE(rs.getString("Type"));
				d1.setAMOUNT(rs.getDouble("Amount"));
				d1.setCATEGORY(rs.getString("Category"));
				d1.setDESCRIPTION(rs.getString("Description"));
				
				set.add(d1);
			}
			
			
			//after adding the data to the SET object the HTTP SEssion object 
			//is created for setting the SET object in it with a URL
			HttpSession sess = req.getSession();
			sess.setAttribute("InNEx_list", set);
			
			RequestDispatcher rd = req.getRequestDispatcher("/incomeNexpense.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}