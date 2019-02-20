package com.uni.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.dao.UserDao;

@Service
public class UserService
{
	@Autowired
	UserDao userDao;
	
	//Authenticate provided credentials
	public boolean login(String UserName,String Password) throws SQLException, NullPointerException 
	{
			if(userDao.checkUser(UserName,Password)) {
				return true;
			}else {
				return false;
			}
	}
	
	//Return UserId of logged user
	public int getUserId(String UserName,String Password) throws Exception {
		return userDao.getUserId(UserName, Password);
	}
	
	//Return unique cartId assigned to specified user to add into session
	public int getCartId(int userId) throws Exception {
			return userDao.getCartId(userId);
	}
}
