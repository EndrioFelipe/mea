package org.mea.controllers;

import java.security.Principal;

import javax.persistence.NoResultException;
import javax.servlet.ServletContext;

import org.mea.daos.PendenciaDAO;
import org.mea.daos.UsuarioDAO;
import org.mea.models.Pendencias;
import org.mea.models.TiposPendencias;
import org.mea.models.UsrRep;
import org.mea.models.UsuarioF;
import org.mea.models.UsuarioTemp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/profile")
public class UsuarioController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	UsuarioDAO usuarioDAO;
	
	@Autowired
	Pendencias pendencias;
	
	@Autowired
	PendenciaDAO pendenciaDAO;
	
	
	
	@RequestMapping(value="{userName}", method=RequestMethod.GET)
	public ModelAndView detalhe(@PathVariable("userName") String userName, Principal principal){
		System.out.println("principal: "+principal.getName());

		UsuarioF usuario = usuarioDAO.find(userName);
	    
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
	
	@RequestMapping("verificacaoCadastro")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("/profile/verificacaoCadastro");		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(UsuarioTemp usuarioTemp, RedirectAttributes redirectAttributes) {
		
		System.out.println(usuarioTemp.getSiape());
		
		try {
			usuarioDAO.findUserRep(usuarioTemp.getSiape());
			UsrRep usrRep = usuarioDAO.findUserRep(usuarioTemp.getSiape());
			pendenciaDAO.gravar(new TiposPendencias(usuarioTemp.getSiape(), usuarioTemp.getNome(), "Cadastro de Usuário", true));
//			pendencias.add(usuarioTemp.getSiape());
			redirectAttributes.addFlashAttribute("resposta", "requisição enviada para homologação.");
		} catch (NoResultException e) {
			redirectAttributes.addFlashAttribute("resposta", "Seu número de siape não consta no nosso banco de dados.");

		}
		
		return new ModelAndView("redirect:../mea");	
		
//	System.out.println("descrição: "+atividade.getDescricao());
//	
//	
//				
//	if(result.hasErrors()){
//        return form(atividade);
//    }		
//    
//     atividadeDAO.gravar(atividade);
//	 return new ModelAndView("redirect:atividades");
	}
	
	
	
}
