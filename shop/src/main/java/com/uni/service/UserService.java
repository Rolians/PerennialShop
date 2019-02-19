package com.uni.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.uni.dao.UserDao;

public class UserService
{
	@Autowired
	UserDao userDao;
	
	//Authenticate provided credentials
	public boolean login(String UserName,String Password) throws Exception 
	{
		try {
			if(userDao.checkUser(UserName,Password)) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			throw e;
		}
	}
	
	//Return UserId of logged user
	public int getUserId(String UserName,String Password) throws Exception {
		try {
			return userDao.getUserId(UserName, Password);
		}catch(Exception e) {
			throw e;
		}
	}
	
	//Return unique cartId assigned to specified user to add into session
	public int getCartId(int userId) throws Exception {
		try {
			return userDao.getCartId(userId);
		}catch(Exception e) {
			throw e;
		}
	}
}
