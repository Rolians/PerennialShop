package com.uni.model;

public class Customer extends User
{
	private int custId;
	private String custName;
	private String address;
	private String email;
	private String contact;
	private String userName;
	private String password;
	private String userType;
	
	public void setUserName(String userName) {
		super.setUserName(userName);
	}
	public void setPassword(String password) {
		super.setPassword(password);
	}
	public void setUserType(String userType) {
		super.setUserType("Customer");
	}
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
}
