<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form:form action="${ s:mvcUrl('AC#gravar').build() }" method="post" commandName="atividade">
		<!-- a tag mvcUrl que gera uma URL de acordo com um determinado controller -->
		<!-- passarmos as iniciais PC para se referir a ProdutosController, o Spring já conseguirá fazer a relação entre os dois. -->
	    <!-- Precisamos passar uma segunda informação para a tag: o método para qual os dados serão enviados. Neste caso, o método será o gravar. -->
	    <!-- commandName, no qual podemos fazer uma referencia a qual entidade aquele formul�rio se refere. nesse caso, seria 
	    algo como: commandName="produto". Dessa forma, nas tags de erros (form:errors) não precisaremos colocar o prefixo produto.. Colocareamos então  só o nome do atributo. -->
	    <!-- enctype="multipart/form-data": É para enviar requisições multipart q podem fazer envios de arquivos, no caso, no sumário -->
		    
		    <div>
		        <label>Descrição</label>
		        <textarea rows="10" cols="20" name="descricao"></textarea>
		    </div>
		    <div>
		        <label>Data de Início</label>
		        <input type="text" name="dataInicio" />
		    </div>
		   
			
  
			  
					<tr>
					
						<td > ${funcionarios[0].nome}</td>
						<input type="hidden" name="func" value="${funcionarios[0].nome}">
						
					</tr>
				 
		    
		
		    	
		    

		    
		      
		    
		    
		    <button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>

</body>
</html>