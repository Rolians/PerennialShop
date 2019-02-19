package com.uni.model;

public class Order 
{
	private int orderId;
	private int cartId;
	private int productId;
	private String prodName;
	private int reqQuantity;
	private int price;

	
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getReqQuantity() {
		return reqQuantity;
	}
	public void setReqQuantity(int reqQuantity) {
		this.reqQuantity = reqQuantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
