
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>


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
	        <a class="nav-link" href="#">Serviços <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Atividades</a>
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

   
