<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/resources" var="Path"/>
<link href="${Path}/css/cssTest.css" rel="stylesheet" type="text/css"  />
<link rel="stylesheet" href="${Path}/css/bootstrap.min.css" /> 
<script src="${Path}/js/jquery.min.js"></script>
<script src="${Path}/js/popper.min.js"></script>  
<script src="${Path}/js/bootstrap.min.js"></script>


<title>Insert title here</title>


</head>
<body class="container">
	 <nav class="navbar navbar-expand-lg navbar-light bg-light">
	  
	  <a class="navbar-brand" href="/mea">
	    <img src="${Path}/arquivos/index.jpeg" width="45" height="30" alt="">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav">
	      <li class="nav-item active">
	        <a class="nav-link" href="#">Serviços <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Atividades</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/mea/paginas/equipe">Equipe</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Dropdown
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Action</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Something else here</a>
	        </div>
	      </li>	
	            
	      <li class="nav-item dropdown">
			<security:authorize access="isAuthenticated()">
			    <security:authentication property="principal" var="usuario"/>
			     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Usuário: ${usuario.username}
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        	<a class="dropdown-item" href="/mea/login">Trocar Usuário</a>
		          <a class="dropdown-item" href="/mea/logout">Logout</a>
		        </div>
			</security:authorize>	
			<security:authorize access="!isAuthenticated()">
			    <a class="nav-link" href="/mea/login">Login</a>
			</security:authorize>			
			
				        
	      </li>
	      
	    </ul>
	  </div>
	</nav>

   
</body>
</html>