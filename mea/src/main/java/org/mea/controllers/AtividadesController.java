package org.mea.controllers;



import java.util.List;

import javax.validation.Valid;

import org.mea.daos.AtividadeDAO;
import org.mea.daos.FuncionariosDAO;
import org.mea.models.Atividades;
import org.mea.models.RepFuncionarios;
import org.mea.validation.AtividadesValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/atividades")
public class AtividadesController {
	
	@Autowired	
    private AtividadeDAO atividadeDAO;
	
	@Autowired	
    private FuncionariosDAO funcionariosDAO;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
	    binder.addValidators(new AtividadesValidation());
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar(){
		List<Atividades> atividades = atividadeDAO.listar();
		List<RepFuncionarios> repFuncionarios = funcionariosDAO.listar();
	    ModelAndView modelAndView = new ModelAndView("/atividades/painelAtividades");
	    modelAndView.addObject("atividades", atividades);
	    modelAndView.addObject("size", repFuncionarios.size());
	    return modelAndView;
	}
	
	@RequestMapping("/form")
	public ModelAndView form(Atividades atividade) {//Para que o objeto do tipo Produto fique disponível em nosso formulário
											   //assim o produto já fica disponível no formulário
											   //oq torna possível o lance de não apagar os outros campos
											   //quando ocorre um erro em um campo
		ModelAndView modelandview = new ModelAndView("atividades/form");
		List<RepFuncionarios> repFuncionarios = funcionariosDAO.listar();
		
//		Funcionarios funcionarios2 = new Funcionarios();
//		funcionarios2.setNome(nome);
		
		modelandview.addObject("repFuncionarios", repFuncionarios);
		
		
		
		return modelandview;
	}
	
	@RequestMapping( method=RequestMethod.POST)
		//(original)
		//public ModelAndView gravar(MultipartFile sumario ,@Valid Produto produto, BindingResult result, RedirectAttributes redirectAttributes) {
		public ModelAndView gravar(@Valid Atividades atividade, BindingResult result)  {
		
		
		
		System.out.println("status: "+atividade.getStatus());
					
		if(result.hasErrors()){
	        return form(atividade);
	    }		
	    
	     atividadeDAO.gravar(atividade);
		 return new ModelAndView("redirect:atividades");
		}
	
	
}
