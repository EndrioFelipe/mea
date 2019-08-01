<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/cabecalho.jsp" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body class="container">
	<h1>Painel de Atividades</h1>
	<a class="nav-link" href="${pageContext.request.contextPath}/atividades/form">cadastro atividades</a>
	
	<table class="table table-bordered table-striped table-hover">
		<tr>
			<th>Descrição</th>
			<th>Data de Início</th>
			<th>Funcionários</th>
			<th>Status</th>
			<th>Porcentagem</th>
			<th>Prioridade</th>
			<th>Observações</th>
		</tr>
			
				<tr>
					
				
				<c:forEach items="${atividades}" var="atividade" varStatus="cont">
					<tr>
						<td>${atividade.descricao }</td> 
						<td >
							<fmt:formatDate pattern="dd/MM/yyyy" value="${atividade.dataInicio.time }" />
						</td>
						 <td>
					
							<c:forEach var = "i" begin = "0" end = "${size}">
						        ${atividade.func[i].nome}   
						    </c:forEach>
						</td> 
						<td>${atividade.status }</td>
						<td>${atividade.porcentagem }</td> 
						<td>${atividade.prioridade }</td> 
						<td>${atividade.observacoes }</td>   
					</tr>
				</c:forEach>
			
	</table>
</body>
</html>
<%@ include file = "/WEB-INF/views/rodape.jsp" %>  