package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet("/displayList")
public class displayList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<customerInfo> c1 = new ArrayList<customerInfo>();

		try {
			Connection conn = connectDB.getConnection();
			PreparedStatement ps2 = conn.prepareStatement("Select * FROM CustomerPurchase");

			ResultSet rs = ps2.executeQuery();

			while (rs.next()) {
				
				//storing data in a object of customerInfo class and then passing that object to the
				//c1 list of customerInfo class , so that data of each row is 
				//added one by one
				customerInfo cstInfo = new customerInfo();
				cstInfo.setID(rs.getInt("purchase_id"));//here setID is for setting
				//data in the object of class customerInfo
				//getInt is a fuction for getting the type of data  present in the 
				//rs variable when executing a query
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
				
				c1.add(cstInfo);
				
			}
			
			//after adding the data to the list object the HTTP SEssion object 
			//is created for setting the list object in it with a URL
			HttpSession sess= req.getSession();
			sess.setAttribute("cst_list", c1); //here an id cst_list is created which is used in the 
			//   customerPurchase.jsp page for redirecting to that page
		
			RequestDispatcher rd = req.getRequestDispatcher("/customerPurchase.jsp");
			
	 		rd.forward(req, resp);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
}

