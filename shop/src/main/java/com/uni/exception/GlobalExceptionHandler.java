package com.uni.exception;

import java.io.IOException;
import java.sql.SQLException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import com.uni.controller.UserNotFoundException;

/*
	Global ExceptionHandler class
	exceptions thrown from any controller will handled here
	Exceptions will match with appropriate handler or generic handler
*/


@ControllerAdvice
@EnableWebMvc
public class GlobalExceptionHandler {
		
	//Handling SQL Exception
	@ExceptionHandler(value = IOException.class)
	public ResponseEntity<String> IOExceptionHandler(Exception e) {
		return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
	}
	
	//Handling exception for wrong user request
	@ExceptionHandler(value=UserNotFoundException.class)
	public ResponseEntity<String> UserNotFound(){
		return new ResponseEntity<String>("Requested User not found", HttpStatus.NOT_FOUND);
	}
	
	//Handling SQL Exception
	@ResponseStatus()
	@ExceptionHandler(value = SQLException.class)
	public ResponseEntity<String> SQLExceptionHandler(Exception e) {
		//return new ResponseEntity<String>(body, status);
		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//Handling Null Pointer Exception
	@ExceptionHandler(value = NullPointerException.class)
	public ResponseEntity<String> NullPointerHandler(Exception e){
		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//Generic Exception
	@ExceptionHandler(value = Exception.class)
	public ResponseEntity<String> GenericException() {
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
}
