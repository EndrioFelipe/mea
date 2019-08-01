<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/cabecalho.jsp" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<html>
<head>

<c:url value="/resources" var="Path"/>
<link href="${Path}/css/cssTest.css" rel="stylesheet" type="text/css"  />
<link rel="stylesheet" href="${Path}/css/bootstrap.min.css" /> 
<link rel="stylesheet" href="${Path}/css/croppie.css" />
<script src="${Path}/js/croppie.js"></script>
<script src="${Path}/js/popper.min.js"></script>  
<script src="${Path}/js/jquery.min.js"></script>
<script src="${Path}/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#my-image, #use {
	  display: none;
	}
</style>
</head>
<body class="container">
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
	    
	    <input type="file" name="file" id="imgInp" />
  		<img id="my-image" src="#" />
		
	
		<button type="submit" class="btn btn-primary submitForm">Cadastrar</button> 
			
	</form:form>
	<button id="use">Upload</button>
	<img id="result" src="">
	 

</body>

<script>
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      $('#my-image').attr('src', e.target.result);
	      var resize = new Croppie($('#my-image')[0], {
	        viewport: { width: 100, height: 100 },
	        boundary: { width: 300, height: 300 },
	        showZoomer: false,
	        enableResize: true,
	        enableOrientation: true
	      });
	      $('#use').fadeIn();
	      $('#use').on('click', function() {
	        resize.result('base64').then(function(dataImg) {
	          var data = [{ image: dataImg }, { name: 'myimgage.jpg' }];
	          // use ajax to send data to php
	          $('#result').attr('src', dataImg);
	        })
	      })
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
	}

	$("#imgInp").change(function() {
	  readURL(this);
	});
</script>
</html>