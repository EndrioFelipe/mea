<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="formEquipe">

	<form:form class="form-group" action="${ s:mvcUrl('PC#gravar').build() }" method="post" commandName="repFuncionarios" id="meuForm" enctype="multipart/form-data">
		
		<div class="form-group">
	        <label>Nome Completo</label>
	        <input class="form-control" type="text" name="nome" />
	    </div>
	    
	    <div class="form-group">
	        <label>Nome Curto (Nome e Sobrenome)</label>
	        <input class="form-control" type="text" name="nomeCurto" />
	    </div>
	    
	    <div class="form-group">
	        <label>Cargo</label>
	        <input class="form-control" type="text" name="cargo" />
	    </div>
	    
	    <input type="file" name="file" id="imagemCarregada" accept=".jpg, .jpeg, .png"/>
  		
  		<div class="preview">
		    <p>No files currently selected for upload</p>
	    </div>
		
	
		<button type="submit" class="btn btn-primary submitForm">Cadastrar</button> 
			
	</form:form>
	
</tags:pageTemplate>