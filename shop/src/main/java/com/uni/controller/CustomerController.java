package com.uni.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;				
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uni.dao.CustomerDao;
import com.uni.exception.GlobalExceptionHandler;
import com.uni.model.*;
import com.uni.service.*;
 

@Controller
public class CustomerController
{
	@Autowired
	CustomerDao dao;
		
	@Autowired
	CustomerService service;

	private static Log logger = LogFactory.getLog(CustomerController.class);
	
	//Mapping with custForm.jsp
	@RequestMapping(value = "/custForm" , method = RequestMethod.GET)
	public String showForm(Model m) {
		logger.info("Logger info msg in cust");
		return "custForm";
	}
	
	//Authenticate the customer and register details
	@RequestMapping(value = "/custForm", method = RequestMethod.POST)
	public String save(@ModelAttribute("customer") Customer customer,ModelMap model,HttpServletRequest req) throws SQLException 
	{
		String name = req.getParameter("custName"); 
		String password = req.getParameter("password");
		String ConfirmPassword = req.getParameter("ConfirmPassword");
		logger.info("This info message in login");

		//Validating retype password		
		boolean result = service.validatePassword(password, ConfirmPassword);
		
		if(!result) {
			model.put("ErrorMsg", "password missmatch");
			return "custForm";
		}else{
			String pass = customer.getPassword();
			customer.setPassword(service.encryptPassword(pass));
			//service.abc(pass);
	
				try {
					if(dao.save(customer)) {
						System.out.println("After handling");
						model.put("name",name);
						logger.info("Succesfully registered");
						return "redirect:/";
					}
					else {
						//If information is not valid redirect back to the registration-page
						model.put("ErrorMsg","Invalid data ... Try with another user name");
						return "custForm";
					}
				} catch (Exception e) {
					logger.error("Request "+req.getRequestURL()+" raised exception");
					throw e;
				}
		}
	}
}

