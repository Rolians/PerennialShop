package com.uni.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.uni.model.*;
import com.uni.dao.ProductDao;;


public class ProductService
{
	@Autowired
	ProductDao pdo;
	
	//Returns the sorted product list
	public List<Product> sortByAttribute(String sortAttribute) throws Exception{
		List<Product> productList = new ArrayList<Product>();
		productList = pdo.showProducts(null);
		if(sortAttribute.equals("prodName")) { 
			productList.sort((Product A,Product B)->A.getProdName().compareTo(B.getProdName()));
		}else {
			productList.sort((Product A,Product B)->A.getCategory().compareTo(B.getCategory()));
		}
		
		return productList;
	}
	
	//Return sum of all products selected in the cart 
	public int SumAll(List<Order> orders) {
		int sum=0;
		for(Order order : orders) {
			int tmp = order.getPrice() * order.getReqQuantity();	
			sum += tmp;
		}
		return sum;
	}
}



