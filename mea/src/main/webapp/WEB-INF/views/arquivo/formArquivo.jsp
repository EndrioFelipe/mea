<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="formEquipe">
	
	

	<form:form class="form-group" action="${ s:mvcUrl('AC#gravarArquivo').build() }" method="post" commandName="arquivo" id="myFileForm" enctype="multipart/form-data">
			    
	    <div class="form-group">
	        <label>Descrição do arquivo </label>
	        <input class="form-control" type="text" name="descricao" />
	    </div>
	    
	    <div class="form-group col-md-4">
	      <label for="inputState">State</label>
	      <select id="inputState" class="form-control" name="pasta.nome">
	        <option selected>Choose...</option>
	        <c:forEach items="${pastas }" var="pasta">
				<option value="${pasta.nome }">${pasta.nome }</option>
			</c:forEach>
	      </select>
	    </div>
	    
	    
	    
	    
		<input class="uploadDate" type="hidden" data-date-format="dd/mm/yyyy" name="dataUpload" /> 
	    
	    <input type="file" name="file" />
  			
	
		<button type="submit" class="btn btn-primary submitForm">Cadastrar Arquivo</button> 
			
	</form:form>
	
	
	
	
</tags:pageTemplate>

<script>
	/* var x = new Date('2013-05-23');
	var y = new Date('2013-04-23');
	console.log(+y > +x); */

	let today = new Date();
	document.querySelector('.uploadDate').value = today.getDate()+'/'+(today.getMonth()+1)+'/'+today.getFullYear();
	
	
</script>