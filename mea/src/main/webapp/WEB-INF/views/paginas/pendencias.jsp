<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


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
</style>

<table class="table ">
	<tr>
		<th>Código da Pendencia</th>
		<th>Nome do Requisitante</th>
		<th>Tipo de Pendência</th>
	</tr>
	<c:forEach items="${tiposPendencias}" var="tp" >
			<tr onclick="window.location='#';">
				
				<td>${tp.codigoPendencia }</td> 
				<td>${tp.nomeRquisitante }</td> 
				<td>${tp.tipoPendencia }</td>
			</tr>
	</c:forEach>
</table>	


</tags:pageTemplate>