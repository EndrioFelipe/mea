package org.mea.controllers;

import java.security.Principal;
import java.util.List;

import org.mea.daos.FuncionariosDAO;
import org.mea.daos.PendenciaDAO;
import org.mea.daos.UsuarioDAO;
import org.mea.infra.FileSaver;
import org.mea.models.Arquivo;
import org.mea.models.Pendencias;
import org.mea.models.RepFuncionarios;
import org.mea.models.RoleF;
import org.mea.models.TiposPendencias;
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
@RequestMapping("/paginas")
public class PaginasController {
	
	@Autowired
	FuncionariosDAO funcionariosDAO;
	
	@Autowired
	FileSaver fileSaver;
	
	@Autowired 
	PendenciaDAO pendenciaDAO;
	
	@Autowired 
	Pendencias pend;
	
	@Autowired 
	UsuarioDAO usuarioDAO;
	
	
	@RequestMapping("pendencias")
    public ModelAndView pagPendencias(){
		List<TiposPendencias> pendencias = pendenciaDAO.listar();
		List<RoleF> roles = usuarioDAO.roles();
		roles.forEach(e -> System.out.println("roles: "+e.getNome()));
		ModelAndView modelandview = new ModelAndView("paginas/pendencias");
		modelandview.addObject("tiposPendencias", pendencias);
		modelandview.addObject("authRoles", roles);
        return modelandview;
    }
	
	@RequestMapping("/checa")
    public @ResponseBody UserQTD gato(String codigo) {
		pendenciaDAO.atualizar(codigo);
		UserQTD userQTD = new UserQTD();
		UsrRep usrRep = new UsrRep();
		UsuarioTemp usrTemp = new UsuarioTemp();
		usrRep = usuarioDAO.findUserRep(codigo);
		usrTemp = usuarioDAO.findUsuarioTemp(codigo);
		userQTD.setUsrRep(usrRep);
		userQTD.setUsrTemp(usrTemp);
		userQTD.setQuantidade(pend.getQuantidade());
		return userQTD;
	}
	
	@RequestMapping("form")
    public ModelAndView form(RepFuncionarios repFuncionarios){
		ModelAndView modelandview = new ModelAndView("paginas/form");
        return modelandview;
    }
	
	@RequestMapping(value="equipe", method=RequestMethod.GET)
	public ModelAndView listar(){
		List<RepFuncionarios> repFuncionarios = funcionariosDAO.listar();
	    ModelAndView modelAndView = new ModelAndView("paginas/equipe");
	    modelAndView.addObject("funcionarios", repFuncionarios);
	    return modelAndView;
	}
	
		
	@RequestMapping(method=RequestMethod.POST)	
	public ModelAndView gravar(MultipartFile file, RepFuncionarios repFuncionarios)  {
	
		System.out.println("equipe");
		System.out.println("nome do arquivo: "+file.getOriginalFilename());
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
