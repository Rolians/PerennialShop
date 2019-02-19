package com.uni.model;

public class User 
{
	private int userId;
	private String userName;
	private String password;
	private String userType;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return "Customer";
	}
	public void setUserType(String userType) {
		this.userType = "Customer";
	}
	
	
}
