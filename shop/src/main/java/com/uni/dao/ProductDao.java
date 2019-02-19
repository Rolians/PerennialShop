package com.uni.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import com.uni.model.Order;
import com.uni.model.Product;

public class ProductDao 
{
	Connection conn;
	
	@Autowired
	BasicDataSource dataSource;
	//Get database Connection object

	//Returns  either list of all products or specified product 
	public List<Product> showProducts(String prodName) throws SQLException {
		List<Product> pl = new ArrayList<Product>();
		
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps;
			if(prodName == null) {
				 ps = conn.prepareStatement("select * from products");
			}else {
				ps = conn.prepareStatement("Select * from products where prodName LIKE ?");
				ps.setString(1, "%"+prodName+"%");
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProdId(rs.getInt(1));
				product.setProdName(rs.getString(2));
				product.setAvailQuantity(rs.getInt(3));
				product.setPrice(rs.getInt(4));
				product.setCategory(rs.getString(5));
				pl.add(product);
			}	
			conn.close();
		}catch(SQLException e) {
			throw new SQLException();
		}catch(NullPointerException ne) {
			throw new NullPointerException();
		}
		return pl;
	}
	
	//Retrieve all details of product with specified product - id  
	public Product selectProductById(int id) throws SQLException {
		Product product = new Product();
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement("Select * from products where prodId = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				product.setProdId(rs.getInt(1));
				product.setProdName(rs.getString(2));
				product.setAvailQuantity(rs.getInt(3));
				product.setPrice(rs.getInt(4));
				product.setCategory(rs.getString(5));				
			}
			conn.close();
		}catch(SQLException e) {
			throw new SQLException();
		}catch(NullPointerException ne) {
			throw new NullPointerException();
		}
		return product;
	}
	
	//Add selected product to the Cart
	public void addToCart(Order order,HttpServletRequest req) {
		System.out.println("Add method of dao");
		HttpSession session = req.getSession();
		int cartId =(Integer)session.getAttribute("cartId");
		try {
			conn = dataSource.getConnection();
			PreparedStatement updateAvailQuantity = conn.prepareStatement("update products set avail_Quantity = avail_Quantity - ? "
					+ " where prodId = ?");	
			updateAvailQuantity.setInt(1, order.getReqQuantity());
			updateAvailQuantity.setInt(2, Integer.parseInt(req.getParameter("prodId")));
			int result = updateAvailQuantity.executeUpdate();
			if(result != 0) {
				//System.out.println("Successful");
			}else {
				//System.out.println("Failed to add");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			PreparedStatement adding = conn.prepareStatement("Insert into Order_detail(cartId,productId,reqQuantity,price) "
					+ "values(?,?,?,?)");
			adding.setInt(1,cartId);
			adding.setInt(2,Integer.parseInt(req.getParameter("prodId")));
			adding.setInt(3,order.getReqQuantity());
			adding.setInt(4,order.getPrice());
			if(adding.execute()) {
				//System.out.println("Successfully added");
			}
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(NullPointerException ne) {
			
		}
	}
	
	
	
	//Retrieve list of all products from the cart of specified user-id
	public List<Order> getCart(HttpServletRequest req) throws SQLException
	{
		HttpSession session = req.getSession();
		int cartId = (Integer)session.getAttribute("cartId");
		List<Order> l1 = new ArrayList<Order>();
		try {
			conn = dataSource.getConnection();
			PreparedStatement getList = conn.prepareStatement("select order_detail.OrderDetailId,products"
					+ ".prodName,order_detail.reqQuantity,order_detail.price from order_detail INNER JOIN products "
					+ "on order_detail.productId=products.prodId where order_detail.cartId = ?;");
			getList.setInt(1, cartId);
			ResultSet rs = getList.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrderId(rs.getInt(1));
				order.setProdName(rs.getString(2));
				order.setReqQuantity(rs.getInt(3));
				order.setPrice(rs.getInt(4));
				l1.add(order);
				
			}
			conn.close();
		}catch(SQLException e){
			throw new SQLException();
		}catch(NullPointerException ne) {
			throw new NullPointerException();
		}
		return l1;
	}
	
	//after Checkout remove all products from cart
	public boolean removeFromCart(HttpServletRequest req) throws SQLException {
		HttpSession session = req.getSession();
		int cartId = (Integer)session.getAttribute("cartId");
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement("Delete from order_detail where cartId = ?");
			ps.setInt(1, cartId);
			int result = ps.executeUpdate();
			if(result != 0) {
				return true;
			}
			conn.close();
		}catch (SQLException sqle) {
			throw new SQLException();
		}catch (NullPointerException e) {
			throw new NullPointerException();
		}
		return false;
	}
	
	
	//Get current date for the order
	public static String getCurrentDate() {
		java.util.Date currDate  = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH-mm-ss");
		return sdf.format(currDate).toString();
	}
	
	
	//Add order details to OrderHistoryTable
	public boolean addToOrderHistory(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int userId = (Integer)session.getAttribute("userId");
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement("Insert into OrderHistory(userId,OrderPrice,OrderDate) values"
					+ "(?,?,?)");
			ps.setInt(1,userId);
			ps.setInt(2,Integer.parseInt(req.getParameter("orderPrice")));
			ps.setString(3, getCurrentDate());
			int result = ps.executeUpdate();
			if(result != 0) {
				return true;
			}
			conn.close();
		}catch(SQLException sle) {
			sle.printStackTrace();
			return false;
		}
		return false;
	}
	//Deleting record from cart with specified orderId
	public boolean deleteFromCart(int orderId) {
		try {
			conn = dataSource.getConnection();
			PreparedStatement deletefromCart = conn.prepareStatement("Delete from order_detail where OrderDetailId = ?");
			deletefromCart.setInt(1, orderId);
			int result = deletefromCart.executeUpdate();
			if(result != 0)
				return true;
			conn.close();
		}catch(SQLException sqle) {
			sqle.printStackTrace();
			return false;
		}
		return false;
	}
}
