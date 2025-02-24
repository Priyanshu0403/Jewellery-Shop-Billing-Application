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

@WebServlet("/updateCustomerData")
public class updateCustomerData extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer uid = Integer.parseInt(req.getParameter("id"));//here no ID as the name="id" is made in the editCustomerData.jsp
		String uname = req.getParameter("name");
		String uphone = req.getParameter("number");
		String uitemname = req.getParameter("itemName");
		Integer uquantity =Integer.parseInt( req.getParameter("quantity"));
		Float uweight = Float.parseFloat(req.getParameter("weight"));
		Double uprice = Double.parseDouble(req.getParameter("price"));
		String userDate = req.getParameter("date");
		LocalDate udate = LocalDate.parse(userDate); 
		Double upaid = Double.parseDouble(req.getParameter("paid"));

		
		try {
			
			Connection conn = connectDB.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("UPDATE customerpurchase SET customer_name=?,contact_number=?,item_name=?,quantity=?,weight=?,price_per_unit=?,purchase_date=?,amount_paid=? WHERE purchase_id=?");
			System.out.println("Working 1");
			
			ps.setString(1, uname);
			ps.setString(2, uphone);
			ps.setString(3, uitemname);
			ps.setInt(4, uquantity);
			ps.setFloat(5, uweight);
			ps.setDouble(6, uprice);
			ps.setDate(7, java.sql.Date.valueOf(udate));
			ps.setDouble(8, upaid);
			ps.setInt(9,uid );//the data to be set in sequence only
								
			int count = ps.executeUpdate();
								
			if(count>0) {
				RequestDispatcher rd = req.getRequestDispatcher("/editCustomerData.jsp");
				rd.include(req, resp);
			}else {
				System.out.println("data not changed");
				RequestDispatcher rd = req.getRequestDispatcher("/editCustomerData.jsp");
				rd.include(req, resp);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
