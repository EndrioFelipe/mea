package org.mea.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.mea.daos.ArquivoDAO;
import org.mea.infra.FileSaver;
import org.mea.models.Arquivo;
import org.mea.models.Pasta;
import org.mea.models.UserQTD;
import org.mea.models.UsrRep;
import org.mea.models.UsuarioTemp;
import org.mea.validation.ArquivoValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/arquivo")
public class ArquivoController {
		
	@Autowired
	FileSaver fileSaver;
	
	@Autowired
	ArquivoDAO arquivoDAO;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
	    binder.addValidators(new ArquivoValidation());
	}
	
	@RequestMapping(value="arquivos", method=RequestMethod.GET)
	public ModelAndView fileList(){		
		List<Pasta> lista = new ArrayList<>(); 
		ModelAndView modelAndView = new ModelAndView("arquivo/arquivos");
	    lista = arquivoDAO.listarPastas();
	    modelAndView.addObject("pastas", lista);
	    return modelAndView;
	}	
	
//	@RequestMapping("formArquivo/{pasta}")
//	public ModelAndView formArquivo(@PathVariable("pasta") String pasta, Arquivo arquivo) {
//		System.out.println("pasta: "+pasta);
//		ModelAndView modelandview = new ModelAndView("arquivo/formArquivo");
//		modelandview.addObject("pasta", pasta);
//		return modelandview;
//	}
	
	@RequestMapping("formArquivo")
	public ModelAndView formArquivo(@RequestParam(value="pasta", required=true) String pasta, String arquivoNome ) {
		Arquivo arquivo = new Arquivo();
		arquivo.setNome(arquivoNome);
		System.out.println("pasta: "+pasta);
		ModelAndView modelandview = new ModelAndView("arquivo/formArquivo");
		modelandview.addObject("pasta", pasta);
		return modelandview;
	}
	
	@RequestMapping(method=RequestMethod.POST)	
	public ModelAndView gravarArquivo(MultipartFile file, @Valid Arquivo arquivo, BindingResult result)  {
	
		
		if(file != null && !file.getOriginalFilename().isEmpty()) {
			System.out.println("dfsggdf");
			String path = fileSaver.write("resources/arquivos/doc", file);
			arquivo.setArquivoPath(path);
		}
		
		arquivo.setNome(file.getOriginalFilename());
		
		arquivoDAO.gravar(arquivo);
					
		if(result.hasErrors()){
	        return formArquivo(arquivo.getPasta().getNome(), arquivo.getNome());
	    }	
	    
		 return new ModelAndView("redirect:arquivo/arquivos");
	}
	
	@RequestMapping("/pasta")
    public @ResponseBody List<Arquivo> selectFolder() {
		List<Arquivo> lista = new ArrayList<>();
		lista = arquivoDAO.listar();
		SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy");
		lista.forEach(e -> s.format(e.getDataUpload().getTime()));
		
		
		//String a = s.format(c.getTime());
		return lista;
	}
	
	@RequestMapping("/deletar")
    public @ResponseBody List<Arquivo> deleteFile(Integer id) {	
		List<Arquivo> lista = new ArrayList<>();
		lista = arquivoDAO.deletar(id);
		//String a = s.format(c.getTime());
		return lista;
	}
}
