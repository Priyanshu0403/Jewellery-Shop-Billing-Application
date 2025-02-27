package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ba.dao.connectDB;
import com.ba.model.customerInfo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editCustomerData")
public class editCustomerData extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//data requested from the servlet is always in type String
		int cust_Id= Integer.parseInt(req.getParameter("ID"));
		
		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM customerpurchase WHERE purchase_id=?");
			ps.setInt(1, cust_Id);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				customerInfo cstInfo = new customerInfo();
				cstInfo.setID(rs.getInt("purchase_id"));
				cstInfo.setCUSTOMERNAME(rs.getString("customer_name"));
				cstInfo.setCONTACTNUMBER(rs.getString("contact_number"));
				cstInfo.setITEMNAME(rs.getString("item_name"));
				cstInfo.setQUANTITY(rs.getInt("quantity"));
				cstInfo.setWEIGHT(rs.getFloat("weight"));
				cstInfo.setPRICE(rs.getDouble("price_per_unit"));
				cstInfo.setTOTAL(rs.getDouble("total_amount"));
				cstInfo.setDATE(rs.getDate("purchase_date"));
				cstInfo.setAMOUNTPAID(rs.getDouble("amount_paid"));
				cstInfo.setDUEAMOUNT(rs.getDouble("due_amount"));
				
				HttpSession sess = req.getSession();
				sess.setAttribute("editCustomer", cstInfo);
				
				RequestDispatcher rd = req.getRequestDispatcher("/editCustomerData.jsp");
				rd.forward(req, resp);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
