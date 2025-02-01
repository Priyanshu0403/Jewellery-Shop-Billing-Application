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

@WebServlet("/purchase")
public class customerPurchase extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uName = req.getParameter("name");
		String uNumber = req.getParameter("number");//getParameter() always returns a String.
		//You cannot directly assign it to an Integer
		//You need to convert the String to an Integer using Integer.parseInt():
		
		String uItemName = req.getParameter("itemName");
		Integer uQuantity = Integer.parseInt(req.getParameter("quantity"));
		Float uWeight = Float.parseFloat(req.getParameter("weight"));
//		Date uDate = Date.parseDate(req.getParameter("date"));
		
		Double uPrice = Double.parseDouble(req.getParameter("price"));
		String userDate = req.getParameter("date");
		LocalDate uDate = LocalDate.parse(userDate);// Convert String to LocalDate
		
		
		try {
			Connection CONN = connectDB.getConnection();
			PreparedStatement ps = CONN.prepareStatement("INSERT INTO CustomerPurchase(customer_name , contact_number, item_name,quantity, weight,price_per_unit, purchase_date) VALUES(?,?,?,?,?,?,?)");
			
			ps.setString(1,uName);
			ps.setString(2,uNumber);
			ps.setString(3, uItemName);
			ps.setInt(4, uQuantity);
			ps.setFloat(5, uWeight);
			ps.setDouble(6, uPrice);
			ps.setDate(7, java.sql.Date.valueOf(uDate));//here direct setLocalDate function is not available
			
			int count=ps.executeUpdate();
			
			
			if(count>0) {
				
				System.out.println("Purchase Successful");
				
				  RequestDispatcher rd=req.getRequestDispatcher("customerPurchase.jsp");//here instead of directly
				  System.out.println("Purchase Successful");
				  //going on the customer page
				  
				  rd.include(req, resp);
				 
			}else {
				
				System.out.println("Purchanse UnsuccessFul");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			}
	}
	
	
	
	//here we are trying 
	
	//till here
}
