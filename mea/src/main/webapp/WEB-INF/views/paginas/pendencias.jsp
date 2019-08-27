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
	
</style>

<table class="table ">
	<tr>
		<th>Código da Pendência</th>
		<th>Nome do Requisitante</th>
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
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Comparativo</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

	<form class="container">
	  <div class="form-group">
	    <div class="col">
	      <label>Siape registrado</label>
	      <input id="formSiape" type="text" class="form-control" disabled>
	    </div>
	    <br>
	    <div class="form-group">
		    <div class="col">
		      <label>Nome registrado</label>
		      <input id="formNomeReg" type="text" class="form-control" readonly>
		    </div>
		    <div class="col">
		      <label>Nome digitado</label>
		      <input id="formNomeDig" type="text" class="form-control" onkeyup="chaveDinamica()">
		    </div>
	    </div>
	  </div>
	</form>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" onClick="fechaModal()" class="btn btn-danger" >Close</button>
      </div>

    </div>
  </div>
</div>




<script>
	
	var usrRepNome;
	
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
			    	
			    	console.log('entrou modal');
			    	
			    	document.querySelector("#formSiape").setAttribute("value", response.usrRep.siape);
			  		colocaValor('#formNomeReg', 'value', response.usrRep.nome);
			  		colocaValor('#formNomeDig', 'value', response.usrTemp.nome);
			  					  		
			  		if(response.usrRep.nome.toUpperCase() == document.querySelector('#formNomeDig').value.toUpperCase()){
			  			cor('verde');
			  		} else {
			  			cor('vermelho');
			  		}
			  		
			  		
			  		function colocaValor(seletor, atributo, valor){
			  			document.querySelector(seletor).value = valor;
			  		}
			  		
			  		
			  		
			});
		
	}
	
	function cor(classe){
			document.querySelector("#formNomeDig").removeAttribute("class");
			document.querySelector("#formNomeDig").classList.add("form-control");
			document.querySelector("#formNomeDig").classList.add(classe);
		}
	
	function fechaModal(){
		$("#meuModal").modal('hide');
		console.log('fecha modal: '+document.querySelector("#formNomeDig").value);
	}
	
	function chaveDinamica(){
		
		if(usrRepNome.toUpperCase() == document.querySelector('#formNomeDig').value.toUpperCase()){
  			cor('verde');
  		} else {
  			cor('vermelho');
  		}
	}
	
</script>

</tags:pageTemplate>

