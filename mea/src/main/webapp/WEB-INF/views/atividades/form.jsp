<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<tags:pageTemplate titulo="Home">

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
				<input class="form-check-input" type="checkbox"  name="" value="${repFuncionarios[cont.index].nome}"  />
				<label >
					${repFuncionarios[cont.index].nome}
				</label>
							  
			</div>		
		</c:forEach> 
			
		
		<div class="form-group">
			<label for="status">Status</label>
			<select class="form-control" name="status" onchange="currentSelector(this)">
				<option value="${estados[0] }">Não Iniciada</option>
				<option value="${estados[1] }">Em Andamento</option>
				<option value="${estados[2] }">Concluída</option>
			</select>
		</div>
	      
		 <div class="form-group">
	        <label>Porcentagem de Conclusão</label>
	        <input class="form-control" type="number" id="porcentage" name="porcentagem" value="0" readonly/>
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
		
		<a onClick="teste()">sadfdas</a>
		
	<script type="text/javascript">
	
		$('#datepicker').datepicker({
	        uiLibrary: 'bootstrap4'
	    });
     
		function currentSelector (valor) {
			console.log('valor: '+valor.value);
			if(valor.value=='EM_ANDAMENTO'){
				document.querySelector('#porcentage').value = '';
				//document.querySelector('#porcentage').removeAttribute('value');
				document.querySelector('#porcentage').removeAttribute('readonly');
				document.querySelector('#porcentage').setAttribute('placeholder','Digite a porcentagem entre 0-100. Utilize apenas números.');
			} else if (valor.value=='CONCLUIDA') {
				document.querySelector('#porcentage').removeAttribute('placeholder');
				document.querySelector('#porcentage').setAttribute('readonly','readonly');
				//document.querySelector('#porcentage').removeAttribute('value');
			//	//document.querySelector('#porcentage').setAttribute('value', 100);
				document.querySelector('#porcentage').value = 100;
			} else {
				document.querySelector('#porcentage').removeAttribute('placeholder');
				document.querySelector('#porcentage').setAttribute('readonly','readonly');
				//document.querySelector('#porcentage').removeAttribute('value');
				//document.querySelector('#porcentage').setAttribute('value', 0);
				document.querySelector('#porcentage').value = 0;
			}
			
		}
		
		function teste () {
			let y  = document.querySelectorAll(".form-check-input");
        	var c = 0;
        	console.log()
		}
		
		function desabilitar () {
	        	

			let x  = document.querySelectorAll(".form-check-input");
        	var c = 0;
        	x.forEach(w => {
        			if(w.checked) {
        				w.setAttribute("name", "func["+c+"].nome");
        				console.log(w);
        			}
        			c++;
        		}); 
        	
        	
        	/* var x  = document.querySelectorAll(".form-check-input");
        	for(var i = 0, j = 0; i < x.length; i++){
        		if(document.querySelector("#check"+i).checked){
        			document.getElementById("check"+i).setAttribute("name", "func["+j+"].nome");
        			j++;	        			
        		}	        		
        	}   */
        	
        	
	        } 
		
	</script>
</body>
</tags:pageTemplate>