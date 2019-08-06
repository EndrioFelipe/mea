package org.mea.controllers;

import java.util.List;

import org.mea.daos.UsuarioDAO;
import org.mea.models.UsuarioF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@Autowired
	UsuarioDAO usuarioDAO;
	
		
	
	 @RequestMapping(value="/login", method=RequestMethod.GET)
	    public ModelAndView loginForm(){
//			 List<UsuarioF> usuarios = usuarioDAO.listar();
			 ModelAndView modelAndView = new ModelAndView("telaLogin");
//			 modelAndView.addObject("usuarios", usuarios);
			 return modelAndView;
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