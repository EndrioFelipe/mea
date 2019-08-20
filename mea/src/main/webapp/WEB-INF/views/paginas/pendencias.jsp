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
			
			<tr onClick="gato(4)">
				<c:choose>
				    <c:when test="${tp.situacao eq true}">
				      	<td class="negrito">${tp.codigoPendencia }</td> 
						<td class="negrito">${tp.nomeRquisitante }</td> 
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


function gato(a) {
	var b = a;
		console.log('esse é o b:'+ b);
	$.post("/mea/paginas/checa",	{	
			name: b }   
		      ,	function(response) {
		
		seleciona.innerHTML = '';
		let e ="";
		let att="";
		
		let opcao = document.createElement("option");
		opcao.textContent = 'qualquer';
		
		for(var i=-1; i<response.length; i++){
			e = document.createElement("option");
			att = document.createAttribute("value");
			att.value = response[i];
			e.setAttributeNode(att);

									
			/* for(var i = 0 ; i >= 5){
				
			} */

			let data = new Date(response[i]);
			let data2 = new Date(response[i-1]);

			console.log(data>data2);

			console.log("data: "+data);
			
			
			let dataFormatada = data.getDate()+"/"+(data.getMonth()+1)+"/"+data.getFullYear();



			
			e.textContent = dataFormatada;
			
			seleciona.appendChild(i == -1 ? opcao : e);

		}
		
		//response.map(item => seleciona.appendChild(e));
	});
} 



</script>

</tags:pageTemplate>