package org.mea.infra;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component //@Bean é a msma coisa, transforma em um componente do string, só q é pra métodos, component é pra classe
public class FileSaver {
	
	@Autowired
    private HttpServletRequest request; //A partir deste objeto, conseguimos extrair o contexto atual em que o usuário se 
										//encontra e então conseguir o caminho absoluto desse diretório em nosso servidor
	
	public String write(String baseFolder, MultipartFile file) {
	    try {
	    	System.out.println("file: "+file.getName());
	        String realPath = request.getServletContext().getRealPath("/"+baseFolder);
	        String path = realPath + "/" + file.getOriginalFilename();
	        file.transferTo(new File(path));
	        System.out.println("path: "+path);
	        System.out.println("baseFolder: "+baseFolder);
	        return baseFolder + "/" + file.getOriginalFilename();

	    } catch (IllegalStateException | IOException e) {
	        throw new RuntimeException(e);
	    }
	}
}
