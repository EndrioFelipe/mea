package org.mea.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	 @RequestMapping(value="/login", method=RequestMethod.GET)
	    public String loginForm(){
		 System.out.println("sdafad");
	        return "telaLogin";
	    }
	 
	 @RequestMapping(value="/logout", method=RequestMethod.GET)
	    public String logout(){
	    	
	    	System.out.println("logout");
	        return "home";
	    }
	    
	    

	/*
	 * @RequestMapping(value="/login", method=RequestMethod.GET) public String
	 * loginForm(@RequestParam(value = "error", required = false) boolean error,
	 * 
	 * @RequestParam(value = "error", required = false) boolean logout){
	 * System.out.println("logout: "+logout);
	 * 
	 * if(logout){ System.out.println("asdf"); } return "/"; }
	 */
    
    
    
    

}