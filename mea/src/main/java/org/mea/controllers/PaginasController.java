package org.mea.controllers;

import java.util.List;

import org.mea.daos.FuncionariosDAO;
import org.mea.infra.FileSaver;
import org.mea.models.RepFuncionarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/paginas")
public class PaginasController {
	
	@Autowired
	FuncionariosDAO funcionariosDAO;
	
	@Autowired
	FileSaver fileSaver;
	
	@RequestMapping("equipe")
    public ModelAndView pagEquipe(){
		System.out.println("sadfdasfdasfasdfdasfdasfasdfadsfads");
		ModelAndView modelandview = new ModelAndView("paginas/equipe");
        return modelandview;
    }
	
	@RequestMapping("form")
    public ModelAndView form(RepFuncionarios repFuncionarios){
		System.out.println("sadfdasfdasfasdfdasfdasfasdfadsfads");
		ModelAndView modelandview = new ModelAndView("paginas/form");
        return modelandview;
    }
	
	@RequestMapping(value="equipe", method=RequestMethod.GET)
	public ModelAndView listar(){
		List<RepFuncionarios> repFuncionarios = funcionariosDAO.listar();
	    ModelAndView modelAndView = new ModelAndView("/paginas/equipe");
	    modelAndView.addObject("funcionarios", repFuncionarios);
	    return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)	
	public ModelAndView gravar(MultipartFile file, RepFuncionarios repFuncionarios)  {
	
	
	if(file != null && !file.getOriginalFilename().isEmpty()) {
		System.out.println("dfsggdf");
		String path = fileSaver.write("resources/arquivos/fotos", file);
		repFuncionarios.setCaminhoFoto(path);
	}
				
////	if(result.hasErrors()){
////        return form(atividade);
////    }		
//    
     funcionariosDAO.gravar(repFuncionarios);
	 return new ModelAndView("redirect:paginas/equipe");
	}
}
