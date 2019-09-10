<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

 <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.css" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.js"></script>


<tags:pageTemplate titulo="Arquivos">

	<a class="nav-link" href="${pageContext.request.contextPath}/arquivo/formArquivo">cadastro de arquivos</a>

	<div class="container">
	  <h2>Arquivos</h2>
	  <p>espaço para descrição</p>
	  <table class="table">
	    
	    	 <thead class="thead-dark">
		      <tr>
		        <th>Nome do Arquivo</th>
		        <th>Descrição</th>
		        <th>Último upload</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${arquivos }" var="arquivo" >
			      <tr>
			      	<td><a class="word" href="${pageContext.request.contextPath}/${arquivo.arquivoPath}">${arquivo.nome }</a></td>
			        <td>${arquivo.descricao }</td>
			        <td class="dateToday" title="${ arquivo.dataUpload.time}">
			        	<fmt:formatDate pattern="dd/MM/yyyy" value="${ arquivo.dataUpload.time}"/>
			        </td> 
			        <td></td>
			      </tr>			      
	 		   </c:forEach>
		    </tbody>
	    
	   
	  </table>
	  
	</div>

<script>
	var lista =[];
	lista = document.querySelectorAll('.dateToday');	
	var secondDate = new Date();
	secondDate.setHours(0,0,0,0);
	var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
	var cont = 0;
	lista.forEach(e => {		
		e = e.firstChild.nodeValue.trim().replace(/\b[/]/g, ',');
		let novo = new Date (e.slice(6, 10)+','+e.slice(3, 5)+','+e.slice(0, 2));
		let diffDays = Math.round(Math.abs((secondDate.getTime() - novo.getTime())/(oneDay)));
		lista[cont].textContent = 'há '+diffDays+' dias.';
		cont++;
	});
</script>

</tags:pageTemplate>