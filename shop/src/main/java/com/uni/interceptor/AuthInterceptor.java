package com.uni.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
This class will check authentication user for the every request
if user is not logged in then it will allowed for some pages
and restricted for rests
*/
public class AuthInterceptor extends HandlerInterceptorAdapter 
{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(!(request.getRequestURI().equals("/shop/home"))
				&& !(request.getRequestURI().equals("/shop/login"))
				&& !(request.getRequestURI().equals("/shop/custForm"))){
			  
			if(request.getSession().getAttribute("userId") == null) {
				response.sendRedirect("home");
				return false;
			}
		}
		return true;
	}
}
