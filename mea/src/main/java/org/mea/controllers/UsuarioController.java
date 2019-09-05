package org.mea.controllers;

import java.net.ConnectException;
import java.security.Principal;

import javax.persistence.NoResultException;
import javax.servlet.ServletContext;

import org.mea.daos.PendenciaDAO;
import org.mea.daos.UsuarioDAO;
import org.mea.models.Pendencias;
import org.mea.models.TiposPendencias;
import org.mea.models.UsuarioF;
import org.mea.models.UsuarioTemp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@Autowired
	private MailSender sender;
	
	
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
	
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(UsuarioTemp usuarioTemp, RedirectAttributes redirectAttributes) {
		
		try {
			usuarioDAO.findUserRep(usuarioTemp.getSiape());
			pendenciaDAO.gravarUsuarioTemp(usuarioTemp);
			pendenciaDAO.gravar(new TiposPendencias(usuarioTemp.getSiape(), usuarioTemp.getNome(), "Cadastro de Usuário", true));
			redirectAttributes.addFlashAttribute("resposta", "Requisição enviada para homologação.");
		} catch (NoResultException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("resposta", "Seu número de siape não consta no nosso banco de dados.");

		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("resposta", "Você já fez uma requisição, aguarde o encerramento da mesma.");
		}
		
		return new ModelAndView("redirect:../mea");	
	}
	
	@RequestMapping("verificacaoCadastro")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("/profile/verificacaoCadastro");		
		return modelAndView;
	}
	
	@RequestMapping(value="cadastroUsuario", method=RequestMethod.POST)
	public ModelAndView cadastroUsuario(UsuarioF usuario) throws ConnectException {
		usuario.setUserName("Teste9");
		System.out.println("siape: "+usuario.getSiape());
		System.out.println("nome: "+usuario.getNome());
		System.out.println("cod uo: "+usuario.getCodUo());
		System.out.println("regional: "+usuario.getNomeReg());
		System.out.println("regional: "+usuario.getRoles());
		pendenciaDAO.gravar(usuario);
		//enviaEmail();		
		ModelAndView modelAndView = new ModelAndView("/profile/cadastroUsuario");		
		return modelAndView;
	}
	
	private void enviaEmail() {
		SimpleMailMessage email = new SimpleMailMessage();
		email.setSubject("Cadastro realizado com sucesso");
		email.setTo("endrio.souza@hotmail.com");
		email.setText("cadastro feito");
		email.setFrom("endrio.souza@hotmail.com");
		
		sender.send(email);
	}
	
	
	
}
