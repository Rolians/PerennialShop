package com.uni.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.uni.dao.*;
import com.uni.model.Order;
import com.uni.model.Product;
import com.uni.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductDao pdo;
	//ProductDao pdo = new ProductDao();
	
	private static Log logger = LogFactory.getLog(ProductController.class);
	
	@Autowired
	ProductService ps;
	//ProductService ps = new ProductService(); 
		 
	//Return either List of all products or only specified 
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String showProductList(HttpServletRequest req ,Model m) throws Exception {
		String name = req.getParameter("sname");
		try {
			List<Product> list = pdo.showProducts(name);
			m.addAttribute("list", list);
			return "productList";
		}
		catch(Exception e) {
			logger.error("Request "+req.getRequestURL()+" raised exception");
			throw e;
		}
	}
	
	//Sorting Product either by product name or category
	@RequestMapping(value = "/sortProductList", method = RequestMethod.GET)
	public String sortProductList(HttpServletRequest req , Model m) throws Exception {
		String attribute = req.getParameter("sortAttribute");
		try {
			List<Product> productList = ps.sortByAttribute(attribute);
			m.addAttribute("list", productList);
			return "productList";
		}
		catch(Exception e) {
			logger.error("Request "+req.getRequestURL()+" raised exception");
			throw e;
		}
	}
	
	
	//Selecting single product by product-id
	@RequestMapping(value = "/selectProduct", method = RequestMethod.GET)
	public String selectProduct(@RequestParam int prodId,Model m) throws Exception {
		
		try {
			 System.out.println("In the select method with " + prodId);
			 Product product = pdo.selectProductById(prodId); 
			 m.addAttribute("product", product);
			 return "selectProduct";
		}
		catch(Exception e) {
			logger.error("Request raised exception");
			throw e;
		}
	}
	
	//Adding selected product to cart
	@RequestMapping(value = "/addToCart", method = RequestMethod.GET)
	public String addToCart(@ModelAttribute("order")Order order,HttpServletRequest req) {
		logger.info("Added product to the cart");
		pdo.addToCart(order,req);
		return "redirect:/productList";
	}
	
	//Show the list of products from cart
	@RequestMapping(value="/showCartDetail", method = RequestMethod.GET)
	public String showCartDetail(HttpServletRequest req,Model model) throws Exception {
		try {
			List<Order> list = pdo.getCart(req);
			int sumofPrice= 0; 
			sumofPrice = ps.SumAll(list);
			model.addAttribute("sum", sumofPrice);
			model.addAttribute("list", list);
			return "showCart";
		}
		catch(Exception e) {
			logger.error("Request raised exception");
			throw e;
		}
				
	}
	
	//Deleting record from cart table
	@RequestMapping(value="/deleteFromCart", method = RequestMethod.GET)
	public String deleteFromCart(@RequestParam int orderId,Model m) {
		System.out.println("Hello "+orderId	);
		if(pdo.deleteFromCart(orderId)) {
			return "redirect:/showCartDetail";
		}
		else {
			m.addAttribute("ErrorMsg", "Unable to remove from cart");
			return "showCart";
		}
	}
	
	//Check-out :- 1. Remove all products from cart
	//             2. Add order details to the OrderHistory
	@RequestMapping(value = "/checkOut", method = RequestMethod.GET)
	public String chechOut(HttpServletRequest req,Model m) throws Exception {
		
		try {
			if(pdo.removeFromCart(req) && pdo.addToOrderHistory(req)) {
				return "redirect:/";
			}else {
				m.addAttribute("ErrorMsg", "Unable to get your order");
				return "showCart";
			}
		}
		catch(Exception e) {
			logger.error("Request "+req.getRequestURL()+" raised exception");
			throw e;
		}
		
	}
	
}
