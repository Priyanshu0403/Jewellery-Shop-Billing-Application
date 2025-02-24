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

@WebServlet("/addCustomerPurchase")
public class addCustomerPurchase extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer uId = Integer.parseInt(req.getParameter("id"));
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
		Double uPaid = Double.parseDouble(req.getParameter("paid"));

		
		try {
			Connection CONN = connectDB.getConnection();
			PreparedStatement ps = CONN.prepareStatement("INSERT INTO customerpurchase(purchase_id,customer_name,contact_number,item_name,quantity,weight,price_per_unit,purchase_date,amount_paid) VALUES(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, uId);
			ps.setString(2,uName);
			ps.setString(3,uNumber);
			ps.setString(4, uItemName);
			ps.setInt(5, uQuantity);
			ps.setFloat(6, uWeight);
			ps.setDouble(7, uPrice);
			ps.setDate(8, java.sql.Date.valueOf(uDate));//here direct setLocalDate function is not available
			ps.setDouble(9, uPaid);

			int count=ps.executeUpdate();
	
			if(count>0) {
				
				  RequestDispatcher rd=req.getRequestDispatcher("addCustomerPurchase.jsp");//here instead of directly
				  System.out.println("Purchase Successful");
				  //going on the customer page
				  
				  rd.include(req, resp);
				 
			}else {
				
				System.out.println("Purchase UnsuccessFul");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			}
	}
	
	
	
	//here we are trying 
	
	//till here
}
