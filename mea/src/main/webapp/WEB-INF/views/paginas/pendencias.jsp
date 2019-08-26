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
				        <td id="idt${cont.index }" class="siape${cont.index }">${tp.codigoPendencia }</td> 
						<td id="idt${cont.index }" class="">${tp.nomeRquisitante }</td> 
						<td id="idt${cont.index }" class="">${tp.tipoPendencia }</td>
				    </c:otherwise>
				</c:choose>
			</tr>
			
	</c:forEach>
</table>	

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <table class="table ">
		<tr>
			<th>Código da Pendência</th>
			<th>Nome do Requisitante</th>
			<th>Tipo de Pendência</th>
		</tr id="#codSiape">
				<tr>
					
				</tr>
	</table>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>




<script>
	
	
	function gato(codigoPendencia, cont, situacao) {
		/*tem que ir testando trocando get por post e vice-versa nesse $.get. Use o chrome pra ver os erros*/
		
		console.log("sit: "+situacao);
		console.log(document.querySelector("#nPend").textContent);
		//if(situacao){
			$.get("${pageContext.request.contextPath}/paginas/checa",	{	
					codigo: codigoPendencia }
				      ,	function(response) {	
				    	  console.log("response: "+response.quantidade);
				    	  console.log("response2: "+response.usrRep.nome);
				    	  document.querySelector("#nPend").textContent = "Pendências("+response.quantidade+")";
				    	  
				    	  let dados = document.querySelectorAll('#idt'+cont);			    		
				    		
				    		dados.forEach(dado => {
				    			console.log('sadfdas');
				    	        console.log(dado.textContent);
				    	        dado.classList.remove('negrito');
				    		});
			});
	//	}
		$("#myModal").modal();
		document.querySelector("#codSiape").textContent = document.querySelector('.siape'+cont).textContent;
		
		
	}
	
</script>

</tags:pageTemplate>

