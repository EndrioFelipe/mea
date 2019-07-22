package org.mea.config;



import org.mea.controllers.HomeController;
import org.mea.daos.AtividadeDAO;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.datetime.DateFormatterRegistrar;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;



@EnableWebMvc
@ComponentScan(basePackageClasses= {HomeController.class, AtividadeDAO.class}) //aqui o spring vai atrás do pacote de controller automaticamente
public class AppWebConfiguration extends WebMvcConfigurerAdapter{ //tem que estender essa classe pra habilitar os js e css do bootstrap
	//basicamente toda classe q tá marcada com @Component tá nesse basePackageClasses, o erro q aparece é aquele dizendo que não
	//tem um bean qualificado
	
	@Bean //diz q o retorne desse método gere uma classe gerenciada pelo spring
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		System.out.println("prefixo e sufixo: "+resolver);
		
		return resolver;
	}
	
	@Bean
	public MessageSource messageSource() { //método que carregará nossos arquivos de mensagens.
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("/WEB-INF/messages");
		messageSource.setDefaultEncoding("UTF-8"); //só pra evitar problemas de caracteres
	    messageSource.setCacheSeconds(1);
	    return messageSource;
	}
	
	@Bean
	public FormattingConversionService mvcConversionService() {
	    DefaultFormattingConversionService conversionService = 
	        new DefaultFormattingConversionService();
	    DateFormatterRegistrar registrar = new DateFormatterRegistrar();
	    registrar.setFormatter(new DateFormatter("dd/MM/yyyy"));
	    registrar.registerFormatters(conversionService);

	    return conversionService;
	}
	
	
	
	@Bean
    public RestTemplate restTemplate(){
        return new RestTemplate();
        //agora é preciso colocar as dependências do jackson para converter o bagulho pro tipo de mensagem q o 
        //servido espera receber
    }
	
	@Bean
    public MultipartResolver multipartResolver(){
        return new StandardServletMultipartResolver();
    }
	
	
	
	@Override
		public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
			// esse método irá configurar o servlet padrão para que este atenda as requisições de arquivos como css e js.
		configurer.enable();//o método enable() deste objeto habilita o servlet padrão do servidor de aplicação
		}
	
}
