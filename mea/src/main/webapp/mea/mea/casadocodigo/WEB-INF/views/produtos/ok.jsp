<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		 <nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa do Codigo</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a>
	      </li>
	      <li class="nav-item dropdown">
	       
	        
	      </li>
	      
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>
	  </div>
	</nav>
</body>
</html>