<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Home">


<body class="container">

	
	<div class="container">
		<h1>Página Inicial</h1>
		
		
		<%-- <a href="${s:mvcUrl('UC#detalhe').arg(0,usuario.userName).build()}" rel="nofollow">Usuário</a> --%>
		<a class="nav-link" href="${s:mvcUrl('AC#listar').build()}">Painel Atividades</a>
		<security:authorize access="hasRole('FUNCMASTER')">	
			<a class="nav-link" href="${s:mvcUrl('AC#form').build()}">cadastro atividades</a>
		</security:authorize>
		<a class="nav-link" href="${s:mvcUrl('PC#listar').build()}">Equipe</a>
	</div>	
	
	
</tags:pageTemplate>

