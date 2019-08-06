
package org.mea.config;

import org.mea.daos.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.filter.CharacterEncodingFilter;



@EnableWebSecurity//esta anotação já configura alguns detalhes de segurança de forma automática. Mas para que isso funcione, o Spring precisa saber que a classe existe.
				  //Tem que colocar essa classe no ServletSpringMVC no método root
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{ //precisa estender essa WebSecurityConfigurerAdapter pra sanar o erro "Hinte try extends WebSecurityConfigurerAdapter"
	//Na verdade a Anotação só habilita o que a WebSecurityConfigurerAdapter faz, que é a configuração
	//ao entrar em http://localhost:8080/casadocodigo/login já é possível ver uma página de login gerada automaticamente
	@Autowired
    private UsuarioDAO usuarioDao;
	
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
		 	.antMatchers("/atividades/form").hasAnyRole("FUNCMASTER")
		 	.antMatchers("/paginas/**").permitAll()
	        .antMatchers("/atividades/**").authenticated()
	        .antMatchers("/resources/**").permitAll()
	        .antMatchers("/login/**").permitAll()
	        .antMatchers("/").permitAll()
	        .anyRequest().authenticated()
	        .and()
            .formLogin()
            .loginPage("/login")
            .failureUrl("/login?error=true")            
            .permitAll()
            .and().logout()
            .logoutSuccessUrl("/")
            .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            .and()
            .exceptionHandling()
            .accessDeniedPage("/acesso");
		 	
		}
	
		@Override
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.userDetailsService(usuarioDao)
	        .passwordEncoder(new BCryptPasswordEncoder());
			
	        
//	        auth
//				.inMemoryAuthentication().withUser("admin").password("admin123")
//				.roles("ADMIN")
//				.and().withUser("usuario").password("user123").roles("USER")
//				.and().withUser("endrio").password("endrio123").roles("USER");
		}
//		
//		@Bean
//		PasswordEncoder passwordEncoder() {
//			return new BCryptPasswordEncoder();
//		}

	
}
