<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/cabecalho.jsp" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<c:url value="/resources" var="Path"/>
<link rel="stylesheet" href="/mea/login/bootstrap.min.css" /> 
<script src="${Path}/js/bootstrap.min.js"></script>
<script src="${Path}/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<title>página genérica</title>
</head>
<body class="container">
	
	<form:form class="form-group" action="${ s:mvcUrl('AC#gravar').build() }" method="post" commandName="atividade" id="meuForm" enctype="multipart/form-data">
		<!-- a tag mvcUrl que gera uma URL de acordo com um determinado controller -->
		<!-- passarmos as iniciais PC para se referir a ProdutosController, o Spring já conseguirá fazer a relação entre os dois. -->
	    <!-- Precisamos passar uma segunda informação para a tag: o método para qual os dados serão enviados. Neste caso, o método será o gravar. -->
	    <!-- commandName, no qual podemos fazer uma referencia a qual entidade aquele formul�rio se refere. nesse caso, seria 
	    algo como: commandName="produto". Dessa forma, nas tags de erros (form:errors) não precisaremos colocar o prefixo produto.. Colocareamos então  só o nome do atributo. -->
	    <!-- enctype="multipart/form-data": É para enviar requisições multipart q podem fazer envios de arquivos, no caso, no sumário -->
		    
	    <div class="form-group">
	        <label>Descrição</label>
	        <textarea class="form-control" rows="3" cols="20" name="descricao"></textarea>
	    </div>
	    
	    <div>
	        <label>Data de Inicio</label>
	        <input id="datepicker" data-date-format="dd/mm/yyyy" type="text" name="dataInicio" />
	    </div>
		
		   		
		 <c:forEach items="${repFuncionarios}" varStatus="cont" >
			<div class="form-check">
				<input class="form-check-input" type="checkbox"  name="" value="${repFuncionarios[cont.index].nome}" id="check${cont.index}"  />
				<label >
					${repFuncionarios[cont.index].nome}
				</label>
							  
			</div>		
		</c:forEach> 
			
		
		<div class="form-group">
			<label for="status">Status</label>
			<select class="form-control" name="status" >
				<option value="Não Iniciada">Não Iniciada</option>
				<option value="Em Andamento">Em Andamento</option>
				<option value="Concluída">Concluída</option>
			</select>
		</div>
	      
		 <div class="form-group">
	        <label>Porcentagem de Conclusão</label>
	        <input class="form-control" type="number" name="porcentagem" />
	    </div>
	    
	    <div class="form-group">
			<label for="prioridade">Prioridade</label>
			<select class="form-control" name="prioridade" >
				<option value="Baixa">Baixa</option>
				<option value="Média">Média</option>
				<option value="Alta">Alta</option>
			</select>
		</div>
	    
	    <div class="form-group">
	        <label>observações</label>
	        <textarea class="form-control" rows="3" cols="20" name="observacoes"></textarea>
	    </div>
	    
	    <td><input type="file" name="file" /></td> 
		
	
		 	<button type="submit" class="btn btn-primary submitForm" onClick="desabilitar()">Cadastrar</button> 
			
		</form:form>
		
	<script type="text/javascript">
	
		$('#datepicker').datepicker({
	        uiLibrary: 'bootstrap4'
	    });
     
	
		function desabilitar () {
	        	var x  = document.querySelectorAll(".form-check-input");
	        	for(var i = 0, j = 0; i < x.length; i++){
	        		if(document.querySelector("#check"+i).checked){
	        			document.getElementById("check"+i).setAttribute("name", "func["+j+"].nome");
	        			j++;	        			
	        		}	        		
	        	}   
	        } 
	</script>
</body>
</html>