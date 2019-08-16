package org.mea.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class HomeController {
	@RequestMapping("/")
	public ModelAndView index() {	
		ModelAndView modelAndView = new ModelAndView("home");
		
		return modelAndView;
	}
	
	@RequestMapping("/acesso")
	public ModelAndView acessoNegado() {	
		ModelAndView modelAndView = new ModelAndView("acesso/acessoProibido");
		
		return modelAndView;
	}
	
	
}
