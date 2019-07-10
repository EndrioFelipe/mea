package org.mea.validation;

import org.mea.models.Atividades;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;



public class AtividadesValidation implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Atividades.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "descricao", "field.required");
	    
	    Atividades atividade  = (Atividades) target;
//	    if(atividade.getPorcentagem()<= 0){
//	        errors.rejectValue("porcentagem", "field.required");
//	    }
		
	}

}
