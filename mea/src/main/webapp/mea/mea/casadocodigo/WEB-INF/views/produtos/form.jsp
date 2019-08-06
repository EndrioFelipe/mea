<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>

<c:url value="/resources/css" var="cssPath" />
<c:url value="/resources/js" var="jsPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="${jsPath}/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
        body{
            padding-bottom: 60px;
        }
    </style>
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
	<div class="container">
	
		<form:form action="${s:mvcUrl('PC#gravar').build()}" method="post" commandName="produto" enctype="multipart/form-data">
		 <!-- a tag mvcUrl que gera uma URL de acordo com um determinado controller -->
		<!-- passarmos as iniciais PC para se referir a ProdutosController, o Spring já conseguirá fazer a relação entre os dois. -->
	    <!-- Precisamos passar uma segunda informação para a tag: o método para qual os dados serão enviados. Neste caso, o método será o gravar. -->
	    <!-- commandName, no qual podemos fazer uma referencia a qual entidade aquele formul�rio se refere. nesse caso, seria 
	    algo como: commandName="produto". Dessa forma, nas tags de erros (form:errors) não precisaremos colocar o prefixo produto.. Colocareamos então  só o nome do atributo. -->
	    <!-- enctype="multipart/form-data": É para enviar requisições multipart q podem fazer envios de arquivos, no caso, no sumário -->
		    <div class="form-group">
		        <label>Título</label>
		       <!-- <input type="text" name="titulo" /> --> 
		       <form:input path="titulo" cssClass="form-control"/> <!-- dessa forma o spring passa a controlar o campo, e os campos já
		        preenchidos não precisem apagar se um deles estiver com erro -->
		        <!-- cssClass é a classe de uma tag do spring -->
		        <form:errors path="titulo"/><!-- LEMBRE-SE Q O COMMANDNAME FAZ COM QUE N�O PRECISE COLOCAR PRODUTO NA FRENTE DE TITULO -->
		    </div>
		    <div class="form-group">
		        <label>Descrição</label>
		        <form:textarea path="descricao" rows="10" cols="20" cssClass="form-control"/>
		        <form:errors path="descricao" />
		    </div>
		    <div class="form-group">
		        <label>Páginas</label>
		        <form:input path="paginas" cssClass="form-control"/>
		        <form:errors path="paginas" /> 
		    </div>
		     <div class="form-group">
		        <label>Data de lançamento:</label>
		        <form:input path="dataLancamento" cssClass="form-control"/>
		        <form:errors path="dataLancamento" /> 
		    </div>
		    
		    <c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
		        <div class="form-group">
		            <label>${tipoPreco}</label>
		            <form:input path="precos[${status.index}].valor" cssClass="form-control"/> 
		            <!-- o name é um array de pre�os que são os 3: ebook, impresso e combo. Cada um tem o seu pr�rpio index,
		            por isso status.index. A razão de colocar ".valor", q � um atributo de preço, � pq � o usu�rio que vai 
		            digitar o valor
		             -->
		            <form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
		            <!-- hidden pq o usuário não pode mexer no tipo. O "value=""" informa qual é o tipo, não é o usuário q escolhe
		            é o programa que dá o valor-->
		        </div>
		    </c:forEach> 
		    
		      <table>
		        <tr>
		            
		            <td><input type="file" name="sumario" /></td>
		        </tr>
		        
		    </table> 
		    
		    
		    <button type="submit" class="btn btn-primary">Cadastrar</button>
		    
		</form:form>
	</div>
</body>
</html>