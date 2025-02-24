package com.ba.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectDB {
	public static Connection getConnection() {
		Connection CONN=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			CONN=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryshop","Priyanshu","1234");
			System.out.println("Database Connected Successfully");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Database connection failed.");
		}
		
		return CONN;	
	}
}
