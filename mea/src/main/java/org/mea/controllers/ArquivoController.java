package org.mea.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.mea.daos.ArquivoDAO;
import org.mea.infra.FileSaver;
import org.mea.models.Arquivo;
import org.mea.models.Pasta;
import org.mea.models.UserQTD;
import org.mea.models.UsrRep;
import org.mea.models.UsuarioTemp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="arquivos", method=RequestMethod.GET)
	public ModelAndView fileList(){		
		List<Pasta> lista = new ArrayList<>(); 
		ModelAndView modelAndView = new ModelAndView("arquivo/arquivos");
	    lista = arquivoDAO.listarPastas();
	    modelAndView.addObject("pastas", lista);
	    return modelAndView;
	}	
	
	@RequestMapping("formArquivo")
	public ModelAndView formArquivo(Arquivo arquivo) {
		ModelAndView modelandview = new ModelAndView("arquivo/formArquivo");
		List<Pasta> lista = new ArrayList<>(); 
		lista = arquivoDAO.listarPastas();
		modelandview.addObject("pastas", lista);
		return modelandview;
	}
	
	@RequestMapping(method=RequestMethod.POST)	
	public ModelAndView gravarArquivo(MultipartFile file, Arquivo arquivo)  {
	
		
		if(file != null && !file.getOriginalFilename().isEmpty()) {
			System.out.println("dfsggdf");
			String path = fileSaver.write("resources/arquivos/doc", file);
			arquivo.setArquivoPath(path);
		}
		
		arquivo.setNome(file.getOriginalFilename());
		
		arquivoDAO.gravar(arquivo);
					
	////	if(result.hasErrors()){
	////        return form(atividade);
	////    }	
	    
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
