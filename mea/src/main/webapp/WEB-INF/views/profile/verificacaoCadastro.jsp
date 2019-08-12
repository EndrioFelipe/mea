<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body class="container">
		<form:form class="form-group" action="${ s:mvcUrl('UC#verificar').build() }" method="post" commandName="repFuncionarios" id="meuForm" enctype="multipart/form-data">
			
			<div class="form-group">
		        <label>Digite o número SIAPE</label>
		        <input class="form-control" type="text" name="siape" />
		    </div>
			
			<div class="form-group">
		        <label>Digite seu Nome completo</label>
		        <input class="form-control" type="text" name="nome" />
		    </div>
		    
		    <div class="form-group">
		        <label>Digite o código de sua Unidade Organizacional</label>
		        <input class="form-control" type="text" name="codUo" />
		    </div>
		    
		    <div class="form-group">
		        <label>Digite o nome de sua Regional</label>
		        <input class="form-control" type="text" name="regional" />
		    </div>
		    
		   			
		
			<button type="submit" class="btn btn-primary submitForm">Submeter para verificação</button> 
				
		</form:form>
		
		 
	
	</body>
</html>