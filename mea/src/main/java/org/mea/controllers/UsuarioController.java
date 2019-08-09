package org.mea.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.mea.daos.UsuarioDAO;
import org.mea.models.UsuarioF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/profile")
public class UsuarioController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	UsuarioDAO usuarioDAO;
	
	
	
	@RequestMapping(value="{userName}", method=RequestMethod.GET)
	public ModelAndView detalhe(@PathVariable("userName") String userName, Principal principal){
		System.out.println("principal: "+principal.getName());

		UsuarioF usuario = usuarioDAO.find(userName);
	    System.out.println("usuario: "+userName.length());
	    System.out.println("principal: "+principal.getName().length());
	    
		if(userName.equals(principal.getName())) {
			System.out.println("aqui");
			ModelAndView modelAndView = new ModelAndView("/profile/paginaUsuario");
			 modelAndView.addObject("usuario", usuario);
			 return modelAndView;
		} else {
			System.out.println("não");
			ModelAndView modelAndView = new ModelAndView("");
			return modelAndView;
		}
	    	
	    
	    
	}
	
}
