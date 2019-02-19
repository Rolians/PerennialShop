package com.uni.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.uni.controller.UserNotFoundException;

public class UserDao 
{
	Connection conn;
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	public boolean checkUser(String userName,String password) throws SQLException 
	{
	
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement("Select * from user where userName = ?");
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String encodedPassword = rs.getString(3);
				
				//Matching with encrypted password 
				if(bcrypt.matches(password, encodedPassword)) {
					return true;
				}
				else {
					rs.close();
					return false;
				}				
			}
			else {
				return false;
			}
		}catch(SQLException e) {
			throw new SQLException();
		}catch(NullPointerException e) {
			throw new NullPointerException("User not found");
		}
		
	}
	
	public int getUserId(String userName,String password) throws Exception {
		int usrId = 0;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement("Select * from user where userName = ?");
			ps.setString(1, userName);
			//ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			if(rs == null) {
				throw new UserNotFoundException("Hello in glb");
			}
			while(rs.next()) {
				System.out.println(rs.getInt(1));
				usrId = rs.getInt(1); 
			}
			
		}catch(SQLException e) {
			throw new Exception();
		}catch(NullPointerException e) {
			throw new Exception("User not found");
		}
		return usrId;
	}
	
	//Returning cartId to save in the session
	public int getCartId(int userId) throws Exception  {
		int cartId = 0;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement("Select cartId from cart where userId = ?");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				cartId = rs.getInt(1);
			}
			conn.close();
		}catch(SQLException e) {
			throw new SQLException();
		}catch(NullPointerException e) {
			throw new NullPointerException();
		}
		return cartId;
	}
	
	
	
}
