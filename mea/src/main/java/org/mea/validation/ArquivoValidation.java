package org.mea.validation;

import org.mea.models.Arquivo;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ArquivoValidation implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Arquivo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "descricao", "field.required");
	    ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
	    
	    Arquivo arquivo = (Arquivo) target;
		
	}
}
