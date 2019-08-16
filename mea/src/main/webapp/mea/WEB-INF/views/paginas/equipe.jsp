<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/cabecalho.jsp" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<c:url value="/resources" var="Path"/>
<link rel="stylesheet" href="/mea/login/bootstrap.min.css" /> 
<script src="${Path}/js/bootstrap.min.js"></script>
<script src="${Path}/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>página genérica</title>

<style>
.row.heading h2 {
	    color: #000;
	    font-size: 52.52px;
	    line-height: 95px;
	    font-weight: 400;
	    text-align: center;
	    margin: 0 0 40px;
	    padding-bottom: 20px;
	    text-transform: uppercase;
	}
	ul{
	  margin:0;
	  padding:0;
	  list-style:none;
	}
	.heading.heading-icon {
	    display: block;
	}
	.padding-lg {
		display: block;
		padding-top: 60px;
		padding-bottom: 60px;
	}
	.practice-area.padding-lg {
	    padding-bottom: 55px;
	    padding-top: 55px;
	}
	.practice-area .inner{ 
	     border:1px solid #999999; 
		 text-align:center; 
		 margin-bottom:28px; 
		 padding:40px 25px;
	}
	.our-webcoderskull .cnt-block:hover {
	    box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
	    border: 0;
	}
	.practice-area .inner h3{ 
	    color:#3c3c3c; 
		font-size:24px; 
		font-weight:500;
		font-family: 'Poppins', sans-serif;
		padding: 10px 0;
	}
	.practice-area .inner p{ 
	    font-size:14px; 
		line-height:22px; 
		font-weight:400;
	}
	.practice-area .inner img{
		display:inline-block;
	}
	
	
	.our-webcoderskull .cnt-block{ 
	   float:left; 
	   width:100%; 
	   background:#fff; 
	   padding:30px 20px; 
	   text-align:center; 
	   border:2px solid #d5d5d5;
	   margin: 0 0 28px;
	}
	.our-webcoderskull .cnt-block figure{
	   width:148px; 
	   height:148px; 
	   border-radius:100%; 
	   display:inline-block;
	   margin-bottom: 15px;
	}
	.our-webcoderskull .cnt-block img{ 
	   width:148px; 
	   height:148px; 
	   border-radius:100%; 
	}
	.our-webcoderskull .cnt-block h3{ 
	   color:#2a2a2a; 
	   font-size:20px; 
	   font-weight:500; 
	   padding:6px 0;
	   text-transform:uppercase;
	}
	.our-webcoderskull .cnt-block h3 a{
	  text-decoration:none;
		color:#2a2a2a;
	}
	.our-webcoderskull .cnt-block h3 a:hover{
		color:#337ab7;
	}
	.our-webcoderskull .cnt-block p{ 
	   color:#2a2a2a; 
	   font-size:13px; 
	   line-height:20px; 
	   font-weight:400;
	}
	.our-webcoderskull .cnt-block .follow-us{
		margin:20px 0 0;
	}
	.our-webcoderskull .cnt-block .follow-us li{ 
	    display:inline-block; 
		width:auto; 
		margin:0 5px;
	}
	.our-webcoderskull .cnt-block .follow-us li .fa{ 
	   font-size:24px; 
	   color:#767676;
	}
	.our-webcoderskull .cnt-block .follow-us li .fa:hover{ 
	   color:#025a8e;
	}

</style>


</head>
<body class="container">
	
	<section class="our-webcoderskull padding-lg">
	  <div class="container">
	    <div class="row heading heading-icon">
	        <h2>Equipe da Auditoria</h2>
	    </div> 
	    
	    <a class="nav-link" href="${pageContext.request.contextPath}/paginas/form">cadastro de equipe</a>
	    
	    
	    <ul class="row">
	      <c:forEach items="${funcionarios}" var="funcionario" >
		      <li class="col-12 col-md-6 col-lg-3">
		          <div class="cnt-block equal-hight" style="height: 349px;">
			            <figure><img src="${pageContext.request.contextPath}/${funcionario.caminhoFoto}" class="img-responsive" alt=""></figure>
			            <h3><a href="#">${funcionario.nomeCurto }</a></h3>
			            <p>${funcionario.cargo }</p>
			            <ul class="follow-us clearfix">
			              <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
			              <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
			              <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
			            </ul>
			          </div>
		      </li>
	      </c:forEach>
	      </ul>
	</section>
		
	
</body>
</html>
<%@ include file = "/WEB-INF/views/rodape.jsp" %>  