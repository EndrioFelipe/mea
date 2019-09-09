package org.mea.controllers;

import java.util.Calendar;

import org.mea.infra.FileSaver;
import org.mea.models.Arquivo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/arquivo")
public class ArquivoController {
		
	@Autowired
	FileSaver fileSaver;
	
	@RequestMapping(value="arquivos", method=RequestMethod.GET)
	public ModelAndView fileList(){
	    ModelAndView modelAndView = new ModelAndView("arquivo/arquivos");
	    return modelAndView;
	}	
	
	@RequestMapping("formArquivo")
	public ModelAndView form(Arquivo arquivo) {
		ModelAndView modelandview = new ModelAndView("arquivo/formArquivo");
		return modelandview;
	}
	
	@RequestMapping(method=RequestMethod.POST)	
	public ModelAndView gravarArquivo(MultipartFile file, Arquivo arquivo)  {
	
		System.out.println("data: "+arquivo.getDataUpload());
		System.out.println("file: "+file.getOriginalFilename());
		if(file != null && !file.getOriginalFilename().isEmpty()) {
			System.out.println("dfsggdf");
			String path = fileSaver.write("resources/arquivos/doc", file);
			arquivo.setArquivoPath(path);
		}
					
	////	if(result.hasErrors()){
	////        return form(atividade);
	////    }		
	//    
	    
		 return new ModelAndView("redirect:arquivo/arquivos");
	}
}
