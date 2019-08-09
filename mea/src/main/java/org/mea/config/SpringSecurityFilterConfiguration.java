package org.mea.config;

import javax.servlet.ServletContext;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;


//classe responsável por inicializar o filtro de segurança, mas essa classe apenas inicializa o filtro de segurança.
//As reais configurações de segurança ficarão na classe SecurityConfiguration
public class SpringSecurityFilterConfiguration extends AbstractSecurityWebApplicationInitializer { //precisa colocar dependências do spring security pra funcionar o import dessa classe AbstractSecur...
	
	@Override
	protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {
		// TODO Auto-generated method stub
		super.beforeSpringSecurityFilterChain(servletContext);
	}
	
}
