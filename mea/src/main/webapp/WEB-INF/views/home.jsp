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
		
		<div class="alert alert-success">
		  <strong id="sucesso">${resposta }</strong> 
		</div>
		
		<a class="nav-link" href="#">Pendências(${pendencias.abc})</a>
		
		
		<%-- <a href="${s:mvcUrl('UC#detalhe').arg(0,usuario.userName).build()}" rel="nofollow">Usuário</a> --%>
		<a class="nav-link" href="${s:mvcUrl('AC#listar').build()}">Painel Atividades</a>
		<security:authorize access="hasRole('FUNCMASTER')">	
			<a class="nav-link" href="${s:mvcUrl('AC#form').build()}">cadastro atividades</a>
		</security:authorize>
		<a class="nav-link" href="${s:mvcUrl('PC#listar').build()}">Equipe</a>
	</div>	
	
	
	<script>
		  var element = document.querySelector(".alert");
		  if(document.getElementById("sucesso").textContent == ""){
			  element.classList.remove("alert");
			  element.classList.remove("alert-success");
		  }
		  
	</script>
	
</tags:pageTemplate>

