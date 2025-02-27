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

@WebServlet("/viewInvoice")
public class viewInvoice extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int invoice_Id = Integer.parseInt(req.getParameter("ID")); 
		System.out.println(invoice_Id);
		try {
			Connection conn = connectDB.getConnection();

			PreparedStatement ps = conn.prepareStatement("SELECT * FROM customerpurchase WHERE purchase_id=?");
			ps.setInt(1, invoice_Id);
			

			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				customerInfo c1 = new customerInfo();
				c1.setID(rs.getInt("purchase_id"));
				c1.setCUSTOMERNAME(rs.getString("customer_name"));
				c1.setCONTACTNUMBER(rs.getString("contact_number"));
				c1.setITEMNAME(rs.getString("item_name"));
				c1.setQUANTITY(rs.getInt("quantity"));
				c1.setWEIGHT(rs.getFloat("weight"));
				c1.setPRICE(rs.getDouble("price_per_unit"));
				c1.setAMOUNTPAID(rs.getDouble("amount_paid"));
				c1.setDUEAMOUNT(rs.getDouble("due_amount"));
				c1.setTOTAL(rs.getDouble("total_amount"));
				c1.setDATE(rs.getDate("purchase_date"));
				

				HttpSession sess = req.getSession();
				sess.setAttribute("view_invoice", c1);
				
				RequestDispatcher rd = req.getRequestDispatcher("/viewInvoice.jsp");
				rd.forward(req, resp);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
