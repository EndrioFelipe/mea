package org.mea.controllers;



import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.mea.daos.AtividadeDAO;
import org.mea.daos.FuncionariosDAO;
import org.mea.models.Atividades;
import org.mea.models.Estado;
import org.mea.models.Funcionarios;
import org.mea.models.Prioridade;
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
	
	@RequestMapping(value="/painelAtividades", method=RequestMethod.GET )
	public ModelAndView listar(){
		System.out.println("atividades");
	    ModelAndView modelAndView = new ModelAndView("/atividades/painelAtividades");
	    return modelAndView;
	}
	
	@RequestMapping("/form")
	public ModelAndView form(Atividades atividade) {//Para que o objeto do tipo Produto fique disponível em nosso formulário
											   //assim o produto já fica disponível no formulário
											   //oq torna possível o lance de não apagar os outros campos
											   //quando ocorre um erro em um campo
		ModelAndView modelandview = new ModelAndView("atividades/form");
		List<Funcionarios> funcionarios = funcionariosDAO.listar();
		
//		Funcionarios funcionarios2 = new Funcionarios();
//		funcionarios2.setNome(nome);
		
		modelandview.addObject("estados", Estado.values());//values é um método que puxa todos os valores do enum
		modelandview.addObject("prioridades", Prioridade.values());
		modelandview.addObject("funcionarios", funcionarios);
		return modelandview;
	}
	
	@RequestMapping( method=RequestMethod.POST)
		//(original)
		//public ModelAndView gravar(MultipartFile sumario ,@Valid Produto produto, BindingResult result, RedirectAttributes redirectAttributes) {
		public ModelAndView gravar(@Valid Atividades atividade, BindingResult result, String func) {
		
		System.out.println(atividade.getDescricao());
		System.out.println(atividade.getDataInicio());
		
				
		System.out.println("func: "+func);
		
		Funcionarios f = new Funcionarios();
		f.setNome(func); 
	
		
		
		//System.out.println(atividade.getDataInicio());
		
		//System.out.println("d: "+descricao);
		//		System.out.println(atividade.getDescricao());
		//o BindingResult tuem que vir depois do produto pq ele valida o produto e por isso tem q vir logo depois
		
		//new FileSaver();
		
		//System.out.println(sumario.getOriginalFilename()); // o método getOriginalFilename(). Este será o teste básico 
														   //para sabermos se o arquivo está sendo enviado corretamente.
														   //tem que fazer um método em appwebconf e servletsrping pra funcionar
		
		if(result.hasErrors()){
	        return form(atividade);
	    }
		
		
		
		/*
		 * String path = fileSaver.write("arquivos-sumario", sumario);//arquivos-sumario
		 * é o nome da pasta e o sumario é o arquivo produto.setSumarioPath(path);
		 *///aqui é pra gravar no bd a localizção do arquivo
	    
	     //atividadeDAO.gravar(atividade);
		 return new ModelAndView("/atividades/painelAtividades");//o redirect devolve um código 302 que é via get e não tem o problema
		 											  //de quando vc atualiza e fica criando o produto de novo
		}
}
