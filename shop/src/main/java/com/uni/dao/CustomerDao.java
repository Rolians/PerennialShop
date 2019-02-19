package com.uni.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import com.uni.model.*;
public class CustomerDao 
{
	Connection conn;
	
	@Autowired
	BasicDataSource dataSource;
	
	/*
	 * This will register the customer in user and customer table where, user_id is
	 * referenced to the customer table , so the first entry is in the user table
	 * and then to the customer and at same time we'll assign unique cart Id to the customer
	 */
	
	
	public boolean save(Customer cust) throws SQLException  {
		int id = 0;
		
			try {
				conn = dataSource.getConnection();
				PreparedStatement setUser = conn.prepareStatement("Insert into user (userName,password,userType) values(?,?,?)");
				setUser.setString(1, cust.getUserName());
				setUser.setString(2, cust.getPassword());
				setUser.setString(3, cust.getUserType());
				int result = setUser.executeUpdate();
				if(result == 0) {
					return false;
				}
			}catch (SQLException e) {
				if(e.getErrorCode() == 1062) {
					return false;
				}else
				throw new SQLException();
			}catch(NullPointerException n) {
				throw new NullPointerException();
			}
				
			//Entry in the user table
		
		try {
			// Get user_id from user name
			PreparedStatement getId = conn.prepareStatement("select userId from user where userName = ?");
			getId.setString(1, cust.getUserName());
			ResultSet rs =  getId.executeQuery();
			if(rs.next()) {
				 id = rs.getInt(1);
			}
			rs.close();
			
			//New entry in the customer table
			PreparedStatement ps = conn.prepareStatement("Insert into CUSTOMER (custId,custName,address,email,contact) "
					+ "values (?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, cust.getCustName());
			ps.setString(3, cust.getAddress());
			ps.setString(4, cust.getEmail());
			ps.setString(5, cust.getContact());
			int result1 = ps.executeUpdate();
			ps.close();
			if(result1 == 0) {
				return false;
			}
		}catch(SQLException e) {
			throw new SQLException("SQL Exception");
		}
		try {
			//Assign cart to every user when it registered successfully
			PreparedStatement AssignCart = conn.prepareStatement("Insert into cart (userId) values (?)");
			AssignCart.setInt(1, id);
			int rs = AssignCart.executeUpdate();
			if(rs == 0) {
				return false;
			}
			else {
				return true;
			}
		}catch(Exception e) {
				throw new SQLException("SQL exception");
		}
	}
}
