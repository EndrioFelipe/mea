package org.mea.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.mea.models.Pendencias;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;



public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer{//classe que carrega todas as configurações de nossa aplicação

	@Override
		protected Class<?>[] getRootConfigClasses() {
			return new Class[]{SecurityConfiguration.class, AppWebConfiguration.class, JPAConfiguration.class, Pendencias.class};
		}
	

	@Override
	protected Class<?>[] getServletConfigClasses() { 
		// TODO Auto-generated method stub
		//return new Class[] {AppWebConfiguration.class, JPAConfiguration.class}; -> tava assim, mas teve que passar pro método de cima pq as configurações de segurança estão iniciando no método 
		//estas requerem as configurações do DAO
		return new Class[] {};
	}

    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }
    
    @Override
	protected void customizeRegistration(Dynamic registration) {
		registration.setMultipartConfig(new MultipartConfigElement("")); 	
	}
    
    @Override
    	protected Filter[] getServletFilters() {
	    	CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
	        encodingFilter.setEncoding("UTF-8");
	        
	        return new Filter[] {encodingFilter};
    	}
    
   
    
    
}
