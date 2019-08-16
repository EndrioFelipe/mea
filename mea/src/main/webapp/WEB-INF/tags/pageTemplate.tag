<%@ tag language="java"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="titulo" required="true" %>

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
	
	
	<title>Título</title>	
	
	</head>
	<body class="container">
	
		<%@ include file = "/WEB-INF/views/cabecalho.jsp" %>   
		
		<jsp:doBody />
		
		<%@ include file = "/WEB-INF/views/rodape.jsp" %>
	
	
	<script>
		var dataT = document.querySelector('#data');
		data = new Date().getFullYear();
		dataT.textContent = "©"+data+" Todos os direitos reservados.";
	</script>
	</body>
</html>
  