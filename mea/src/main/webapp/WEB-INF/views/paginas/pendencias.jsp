<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<script src="http://code.jquery.com/jquery-1.8.3.js"></script>


<tags:pageTemplate titulo="Equipe">

<style>
	.table{
		font-size: 0.8em;
		margin: 150px 0px;
	} 
	
	.table td{ 
		cursor: pointer; 
	}		
	
	.table td{
		padding: 10px 0px 0px 0px;
	}
	
	.table th{
		padding: 10px 0px 0px 0px;
	}
	
	.negrito{
		background-color: lightblue;
	}
	
	.verde{
		color: #4F8A10;
    	background-color: #DFF2BF;
	}
	
	.vermelho{
		color: #D8000C;
    	background-color: #FFD2D2;;
	}
	
	.amarelo{
		color: #9F6000;
    	background-color: #FEEFB3;
	}
	
	.container-form {
		padding-right: 50px;
		padding-left: 50px;
	}
	
	.column {
		padding-right: 15px;
		padding-bottom: 20px;
	}
	
	
	
	
</style>

<table class="table ">
	<tr>
		<th>Código da Pendência</th>
		<th>Nome do Requerente</th>
		<th>Tipo de Pendência</th>
	</tr>
	<c:forEach items="${tiposPendencias}" var="tp" varStatus="cont" >
			<tr onClick="gato(${tp.codigoPendencia }, ${cont.index }, ${tp.situacao })">
				<c:choose>
				    <c:when test="${tp.situacao eq true}">
				      	<td id="idt${cont.index }" class="negrito siape${cont.index }">${tp.codigoPendencia }</td> 
						<td id="idt${cont.index }" class="negrito">${tp.nomeRquisitante }</td> 
						<td id="idt${cont.index }" class="negrito">${tp.tipoPendencia }</td>
				    </c:when>
				    <c:otherwise>
				        <td class="siape${cont.index }">${tp.codigoPendencia }</td> 
						<td class="">${tp.nomeRquisitante }</td> 
						<td class="">${tp.tipoPendencia }</td>
				    </c:otherwise>
				</c:choose>
			</tr>
			
	</c:forEach>
</table>	


<!-- The Modal -->
<div class="modal" id="meuModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Cadastro de usuário</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

	<form:form action="${s:mvcUrl('UC#cadastroUsuario').build() }">
	  <div class="form-group container-form">
	    <div class="row">
		    <div class="col">
		      <label>Siape</label>
		      <input id="formSiape" type="text" class="form-control" disabled>
		    </div>
	    </div>
	    <hr>
	    <label>Nome</label>
	    <table width="100%">
	    	<col width="45%">
  			<col width="45%">
  			<col width="10%">
		    
		    <c:set var="count" value="-1"/>
		    
			    <tr class="">
				      <c:set var="count" value="${count +1}"/>
				      
				      <td class="column element"><input id="formReg${count }" type="text" class="form-control" readonly></td>
				    
				      <td class="column element"><input id="formDig${count }" type="text" name="nome" class="form-control" onkeyup="chaveDinamica('#formNomeReg', '#formNomeDig')"></td>
				  
					  <td class="column">copiar</td>
				      
				    
			    </tr>
			    <tr class="">
				    
				      <c:set var="count" value="${count +1}"/>
				      
				      <td class="column element"><input id="formReg${count }" type="text" class="form-control" readonly></td>
				    
				      <td class="column element"><input id="formDig${count }" type="text" name="nome" class="form-control" onkeyup="chaveDinamica('#formCUOReg', '#formCUODig')"></td>
				  
					  <td class="column">copiar</td>
				      
				    
			    </tr>
			    <tr class="">
				    
				      <c:set var="count" value="${count +1}"/>
				      
				      <td class="column element"><input id="formReg${count }" type="text" class="form-control" readonly></td>
				    
				      <td class="column element"><input id="formDig${count }" type="text" name="nome" class="form-control" onkeyup="chaveDinamica('#formRegionalReg', '#formRegionalDig')"></td>
				  
					  <td class="column">copiar</td>
				      
				    
			    </tr>
		    
	    </table>
	    <hr>
	    <!-- <div class="row">
		    <div class="col">
		      <label>Código da Unidade Organizacional</label>
		      <input id="formCUOReg" type="text" class="form-control" readonly>
		    </div>
		    <div class="col">
		      <label>Código da Unidade Organizacional digitado</label>
		      <input id="formCUODig" type="text" class="form-control" onkeyup="chaveDinamica('#formCUOReg', '#formCUODig')">
		    </div>
	    </div>
	    <hr>
	    <div class="row">
		    <div class="col">
		      <label>Nome da Regional</label>
		      <input id="formRegionalReg" type="text" class="form-control" readonly>
		    </div>
		    <div class="col">
		      <label>Nome da Regional digitado</label>
		      <input id="formRegionalDig" type="text" class="form-control" onkeyup="chaveDinamica('#formRegionalReg', '#formRegionalDig')">
		    </div>
	    </div>
	  </div> -->
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-danger" >Cadastrar</button>
	      </div>
    </form:form>

    </div>
  </div>
</div>






<script>

	
	
	
	
	//console.log('attr: '+document.querySelector('.var').getAttribute('value'));
	
	
	
	
	function gato(codigoPendencia, cont, situacao) {
		/*tem que ir testando trocando get por post e vice-versa nesse $.get. Use o chrome pra ver os erros*/
		
		
		
			$.get("${pageContext.request.contextPath}/paginas/checa",	{	
					codigo: codigoPendencia }
				      ,	function(response) {	
				    	  document.querySelector("#nPend").textContent = "Pendências("+response.quantidade+")";
				    	  usrRepNome = response.usrRep.nome;
				    	  if(situacao){
				    	  
					    	  let dados = document.querySelectorAll('#idt'+cont);			    		
					    		
					    		dados.forEach(dado => {
					    	        dado.classList.remove('negrito');
					    		});
				    		
				    	  }
				    	
				    	  
				    	$("#meuModal").modal();	  
				    	  
				    	var responseList = [response.usrRep.nome, response.usrTemp.nome, 
				    						 response.usrRep.codeUo, response.usrTemp.codUo,
				    						 response.usrRep.nomeReg, response.usrTemp.regional];
				    	
				        var count = 0;
				    	for (var i = 0; i < responseList.length/2; i++){
				    		for (var j = 0; j < responseList.length; j = count){
					    		insertValue('#formReg'+i, responseList[count]);
					    		count++;
					    		insertValue('#formDig'+i, responseList[count]);
					    		count++;
					    		break;
					    	}
				    	} 
				    	
				  		var allElements = document.querySelectorAll('.element');
				  						  		
				  		
				  		for(var index = 0; index < allElements.length; index++) {
							verifica('#formReg'+index, '#formDig'+index);
						}
				  		
				    	
				    	document.querySelector("#formSiape").setAttribute("value", response.usrRep.siape);
				  		
				  		
				  		console.log('é igual? '+document.querySelector('#formNomeReg').value.toUpperCase() == document.querySelector('#formNomeDig').value.toUpperCase());
				  		
				  		function verifica(seletor1, seletor2) {
				  			
					  		(document.querySelector(seletor1).value.toUpperCase() == document.querySelector(seletor2).value.toUpperCase()) ?
					  				cor(seletor2, 'verde') : cor(seletor2, 'vermelho');				  			
					  		}			  		
				  		
				  		function insertValue(seletor, valor){
				  			console.log('seletor '+seletor);
				  			console.log('valor '+valor);
				  			document.querySelector(seletor).value = valor;
				  		}
			  		
			  		
			  		
			});
		
	}
	
	function cor(seletor, classe){
			document.querySelector(seletor).removeAttribute("class");
			document.querySelector(seletor).classList.add("form-control");
			document.querySelector(seletor).classList.add("bunda");
			document.querySelector(seletor).classList.add(classe);
		}
	
	function fechaModal(){
		$("#meuModal").modal('hide');
		console.log('fecha modal: '+document.querySelector("#formNomeDig").value);
	}
	
	function chaveDinamica(seletor1, seletor2){
		
		if(document.querySelector(seletor1).value.toUpperCase() == document.querySelector(seletor2).value.toUpperCase()){
  			cor(seletor2, 'verde');
  		} else {
  			cor(seletor2, 'amarelo');
  		}
	}
	
</script>

</tags:pageTemplate>

