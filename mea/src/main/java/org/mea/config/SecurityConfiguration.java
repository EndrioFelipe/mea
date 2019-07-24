
package org.mea.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;



@EnableWebSecurity//esta anotação já configura alguns detalhes de segurança de forma automática. Mas para que isso funcione, o Spring precisa saber que a classe existe.
				  //Tem que colocar essa classe no ServletSpringMVC no método root
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{ //precisa estender essa WebSecurityConfigurerAdapter pra sanar o erro "Hinte try extends WebSecurityConfigurerAdapter"
	//Na verdade a Anotação só habilita o que a WebSecurityConfigurerAdapter faz, que é a configuração
	//ao entrar em http://localhost:8080/casadocodigo/login já é possível ver uma página de login gerada automaticamente
	
	
	///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////	ATENÇÃO
////	TEM QUE DAR UPDATE PROJECT PRO RESOURCES FUNCIONAR DIREITO
///////////////////////////////////////////////////////////////////////////////////
	
	@Override
		protected void configure(HttpSecurity http) throws Exception {
		
		
///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////	Resolver o Erro do Encoding com Spring security
///////////////////////////////////////////////////////////////////////////////////
		
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter,CsrfFilter.class);
		
		 http.authorizeRequests() 
		 	.antMatchers("/atividades/form").hasRole("admin")
	        .antMatchers("/atividades/**").permitAll()
	        .antMatchers("/resources/**").permitAll()
	        .antMatchers("/").permitAll()
	        .anyRequest().authenticated()
	        .and().formLogin();
		 	
		}
	
		
	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		// TODO Auto-generated method stub
//		http.authorizeRequests()
//		.antMatchers("/atividades/form").hasRole("ADMIN")
//	    .antMatchers("/atividades").permitAll()
//	    .antMatchers("/").permitAll()	    
//	    .anyRequest().authenticated()
//	    .and().formLogin();
//	}
	
	 
	
	
//	@Autowired
//	private UsuarioDAO usuarioDao;
//	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		//a ordem dos métodos que vem a seguir importa, pois não adianta liberar tudo e depois bloquear. O ideal é
//		//fazer os bloqueios primeiro e depois liberar.
//	    http.authorizeRequests()
//	    .antMatchers("/resources/**").permitAll()
//	    .antMatchers("/carrinho/**").permitAll()
//	    .antMatchers("/pagamento/**").permitAll()
//	    .antMatchers("/produtos/form").hasRole("ADMIN")//No BD a gente colocou ROLE_ADMIN, mas aqui não precisa do ROLE pq o hasRole já coloca automaticamente o ROLE_
//	    .antMatchers(HttpMethod.POST, "/produtos").hasRole("ADMIN")
//	    .antMatchers(HttpMethod.GET, "/produtos").hasRole("ADMIN")
//	    .antMatchers("/produtos/**").permitAll()
//	    .antMatchers("/").permitAll() 
//	    .anyRequest().authenticated()
//	    .and().formLogin();
//	  // .antMatchers("/produtos/**").permitAll()aqui libera produtos/detalhe por exemplo
//	  //home da casa do código
//	}
//	
//	
//	@Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(usuarioDao)//userDetailsService é um método de uma interface do Spring q trabalha com as configurações de autenticação, logo, UsuarioDAO deve implementar UserDetailsService
//        	.passwordEncoder(new BCryptPasswordEncoder());//esse BCryptPasswordEncoder() vai ser o encodificador da senha
//    }
	
}
