package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ba.dao.connectDB;
import com.ba.model.adminInfo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("Uname");
		String upass=req.getParameter("Upass");
		
		try {
			Connection CONN=connectDB.getConnection();
			PreparedStatement ps=CONN.prepareStatement("SELECT * FROM admin_data WHERE User_Name=? AND Password=?");
			ps.setString(1, uname);
			ps.setString(2, upass);
			
			ResultSet rs= ps.executeQuery();
			
			if(rs.next()) {
//				adminInfo ad=new adminInfo();
//				ad.setName(rs.getString("User_Name"));
//				ad.setEmail(rs.getString("Email_Id"));
				
				RequestDispatcher rd = req.getRequestDispatcher("/adminDashboard.jsp");
				rd.forward(req, resp);
			}else {
				RequestDispatcher rd= req.getRequestDispatcher("/index.jsp");
				rd.forward(req, resp);
			}
			
		} catch (Exception e) {
			
		}
	}
}
