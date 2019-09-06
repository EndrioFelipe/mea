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

<script>
	var input = document.querySelector('#imagemCarregada');
	var preview = document.querySelector('.preview');
	
	input.addEventListener('change', updateImageDisplay);

	function updateImageDisplay() {
		  while(preview.firstChild) {
		    preview.removeChild(preview.firstChild);
		  }

		  var curFiles = input.files;
		  if(curFiles.length === 0) {
		    var para = document.createElement('p');
		    para.textContent = 'No files currently selected for upload';
		    preview.appendChild(para);
		  } else {
		    var list = document.createElement('ol');
		    preview.appendChild(list);
		    for(var i = 0; i < curFiles.length; i++) {
		      var listItem = document.createElement('li');
		      var para = document.createElement('p');
		      if(validFileType(curFiles[i])) {
		        para.textContent = 'File name ' + curFiles[i].name + ', file size ' + returnFileSize(curFiles[i].size) + '.';
		        var image = document.createElement('img');
		        image.src = window.URL.createObjectURL(curFiles[i]);

		        listItem.appendChild(image);
		        listItem.appendChild(para);

		      } else {
		        para.textContent = 'File name ' + curFiles[i].name + ': Not a valid file type. Update your selection.';
		        listItem.appendChild(para);
		      }

		      list.appendChild(listItem);
		    }
		  }
		}
	
	var fileTypes = [
		  'image/jpeg',
		  'image/pjpeg',
		  'image/png'
		]

		function validFileType(file) {
		  for(var i = 0; i < fileTypes.length; i++) {
		    if(file.type === fileTypes[i]) {
		      return true;
		    }
		  }

		  return false;
		}
	
	function returnFileSize(number) {
		  if(number < 1024) {
		    return number + 'bytes';
		  } else if(number >= 1024 && number < 1048576) {
		    return (number/1024).toFixed(1) + 'KB';
		  } else if(number >= 1048576) {
		    return (number/1048576).toFixed(1) + 'MB';
		  }
		}


</script>