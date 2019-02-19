package com.uni.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import com.uni.model.Customer;
import com.uni.model.User;
import com.uni.service.UserService;

@Controller
public class AuthController 
{
	@Autowired
	UserService userservice;
	//UserService service = new UserService();
	
	private Log logger = LogFactory.getLog(AuthController.class);
	
	//Mapping index.jsp 
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "redirect:/";
	}
	
	
	//Mapping login.jsp
	@RequestMapping(value = "/login" , method  = RequestMethod.GET)
	public String showLoginForm() {
		return "login";
	}
	
	//Authenticate the user with specified details
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String authentiate(@ModelAttribute("user") User user,ModelMap model, HttpServletRequest req) throws Exception
	{
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		try {
			if(userservice.login(userName, password)) {
				
				//Adding UserId and CartId in the Session 			
				int userId = userservice.getUserId(userName, password);
				HttpSession session = req.getSession();
				session.setAttribute("userId", userId);
				session.setAttribute("cartId", userservice.getCartId(userId));
				logger.info("new user logged in");
				model.put("name", userName);
				return "redirect:/";
			}else {
				model.put("ErrorMsg", "Invalid credentials");
				return "login";	
			}
			
		//Throwing exception to global handler 
		}catch(Exception e) {
			logger.error("Request "+req.getRequestURL()+" raised exception");
			throw e;
		}
	}
	
	//Logout user :- Remove user's attributes from the user and invalidate session 
	@RequestMapping(value= "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/";
	}
}
