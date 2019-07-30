package org.mea.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/paginas")
public class PaginasController {
	@RequestMapping("equipe")
    public ModelAndView pagEquipe(){
		System.out.println("sadfdasfdasfasdfdasfdasfasdfadsfads");
		ModelAndView modelandview = new ModelAndView("paginas/equipe");
        return modelandview;
    }
}
