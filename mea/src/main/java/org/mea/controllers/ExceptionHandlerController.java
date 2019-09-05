package org.mea.controllers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice //é um controller que observa todos os outros controllers
public class ExceptionHandlerController {
	@ExceptionHandler(Exception.class)
	public String genericError(){
	    return "/acesso/erro";
	}
}
