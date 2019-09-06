
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<%-- 
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
	        <a class="nav-link" href="/mea">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/mea/atividades">Atividades</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" id="nPend" href="/mea/paginas/pendencias">Pendências(${pendencias.quantidade})</a>
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
		        	<a class="dropdown-item" href="${pageContext.request.contextPath}/profile/${usuario.userName}" rel="nofollow">profile</a>
		        	<a class="dropdown-item" href="/mea/login">Trocar Usuário</a>
		          <a class="dropdown-item" href="/mea/logout">Logout</a>
		        </div>
			</security:authorize>	
			<security:authorize access="!isAuthenticated()">
			    <form:form id="login-form" cssClass="form" action="${pageContext.request.contextPath}/login" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Senha:</label><br>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            <div class="form-group">
                            	<label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div> 
                        </form:form>
			</security:authorize>			
			
				        
	      </li>
	    </ul>
	  </div>
	</nav>
	
	 --%>


		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
		* {box-sizing: border-box;}
		
		body {
		  margin: 0;
		  font-family: Arial, Helvetica, sans-serif;
		}
		
		.topnav {
		  overflow: hidden;
		  background-color: #e9e9e9;
		}
		
		.topnav a {
		  float: left;
		  display: block;
		  color: black;
		  text-align: center;
		  padding: 14px 16px;
		  text-decoration: none;
		  font-size: 17px;
		}
		
		.topnav a:hover {
		  background-color: #ddd;
		  color: black;
		}
		
		.topnav a.active {
		  background-color: #2196F3;
		  color: white;
		}
		
		.topnav .login-container {
		  float: right;
		}
		
		.topnav input{
		  padding: 6px;
		  margin-top: 8px;
		  font-size: 17px;
		  border: none;
		  width:120px;
		}
		
		.topnav .login-container button {
		  float: right;
		  padding: 6px 10px;
		  margin-top: 8px;
		  margin-right: 16px;
		  background-color: #555;
		  color: white;
		  font-size: 17px;
		  border: none;
		  cursor: pointer;
		}
		
		.topnav .login-container button:hover {
		  background-color: green;
		}
		
		@media screen and (max-width: 600px) {
		  .topnav .login-container {
		    float: none;
		  }
		  .topnav a, .topnav input[type=text], .topnav .login-container button {
		    float: none;
		    display: block;
		    text-align: left;
		    width: 100%;
		    margin: 0;
		    padding: 14px;
		  }
		  .topnav input[type=text] {
		    border: 1px solid #ccc;  
		  }
		}
		
		
		.dropdown-menu{
			position: relative;
			min-width: 11.25rem;
			border-radius: 0rem;
		} 
		
		.navSpec {
			min-width: 180px;
		}
		</style>
		</head>
		<body>
		
		<div class="topnav">
		  <a class="active" href="/mea">Home <span class="sr-only">(current)</span></a>
		  <a href="/mea/atividades">Atividades</a>
		  <a href="/mea/paginas/equipe">Equipe</a>
		  <a href="/mea/paginas/arquivos">Arquivos</a>
		  <a id="nPend" href="/mea/paginas/pendencias">Pendências(${pendencias.quantidade})</a>
		  <div class="login-container">
			 
				 <security:authorize access="isAuthenticated()">
				    <security:authentication property="principal" var="usuario"/>
					   
					          <a class="navSpec nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						          ${usuario.username}
						      </a>
				        
					        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					        	<a class="dropdown-item" href="${pageContext.request.contextPath}/profile/${usuario.userName}" rel="nofollow">profile</a>
					        	<a class="dropdown-item" href="/mea/login">Trocar Usuário</a>
					          <a class="dropdown-item" href="/mea/logout">Logout</a>
					        </div>
				        
			        </div> 
			      
		        
			</security:authorize>
			 
			 
			 <security:authorize access="!isAuthenticated()">
			    <form:form id="login-form" action="${pageContext.request.contextPath}/login" method="post">
                
                      <input type="text" placeholder="Username" name="username" id="username">
                      <input type="password" placeholder="Password" name="password" id="password">
<%--                   	<label for="remember-me" ><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
 --%>                 <button type="submit" name="submit" value="submit">Login</button>
                          
                </form:form>
			</security:authorize>	 
		  
		  
		  </div>
		</div>
		
		


   
