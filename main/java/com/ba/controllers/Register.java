package com.ba.controllers;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ba.dao.connectDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
	//this class is used to post the data in the database so we use doPost method
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		PrintWriter out= resp.getWriter();
//		out.print("Working");  //this will be printed on the server not on the console
		
		String uname=req.getParameter("Uname");	
		String uemail=req.getParameter("Uemail");
		String upass=req.getParameter("Upass");
		
//		System.out.println(uname);  // to check if the program is running or not
//		System.out.println(uemail);
//		System.out.println(upass);
		
		try {
			Connection CONN = connectDB.getConnection();
			PreparedStatement ps = CONN.prepareStatement("INSERT INTO admin_data VALUES(?,?,?)");
			ps.setString(1,uname);
			ps.setString(2,uemail);
			ps.setString(3,upass);
			
			int count=ps.executeUpdate();
			
			if(count>0) {
				System.out.println("Registeration successful");
				RequestDispatcher rd= req.getRequestDispatcher("/index.jsp");
				rd.include(req, resp);
			}else {
				System.out.println("Registeration Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
