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
		<th>Código da Pendencia</th>
		<th>Nome do Requisitante</th>
		<th>Tipo de Pendência</th>
	</tr>
	<c:forEach items="${tiposPendencias}" var="tp" varStatus="cont" >
			<%-- <tr onclick="ancora(${cont.index})">
				
				<td class="idt${cont.index} negrito">${tp.codigoPendencia }</td> 
				<td class="idt${cont.index} negrito">${tp.nomeRquisitante }</td> 
				<td class="idt${cont.index} negrito">${tp.tipoPendencia }</td>
			</tr> --%>
			<tr onClick="gato(${tp.codigoPendencia }, ${cont.index }, ${tp.situacao })">
				<c:choose>
				    <c:when test="${tp.situacao eq true}">
				      	<td class="negrito">${tp.codigoPendencia }</td> 
						<td id="trocaNome${cont.index }" class="negrito">${tp.nomeRquisitante }</td> 
						<td class="negrito">${tp.tipoPendencia }</td>
				    </c:when>
				    <c:otherwise>
				        <td class="">${tp.codigoPendencia }</td> 
						<td class="">${tp.nomeRquisitante }</td> 
						<td class="">${tp.tipoPendencia }</td>
				    </c:otherwise>
				</c:choose>
			</tr>
			
	</c:forEach>
</table>	

<a href="/mea/paginas/checa">teste</a>


<script>

/* function ancora (b){
	console.log("b: "+b);
	let dados = document.querySelectorAll('.idt'+b);
	
	
	dados.forEach(dado => {
        console.log(dado.textContent);
        dado.classList.remove('negrito');
	});
} */


function gato(codigoPendencia, cont, situacao) {
	/*tem que ir testando trocando get por post e vice-versa nesse $.get. Use o chrome pra ver os erros*/
	console.log("sit: "+situacao);
	if(situacao){
		$.get("${pageContext.request.contextPath}/paginas/checa",	{	
				codigo: codigoPendencia }   
			      ,	function(response) {
			    	  
			console.log("response: "+response);
			document.querySelector("#trocaNome"+cont).textContent = response;
			
		});
		
	}
}
	




</script>

</tags:pageTemplate>