<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>tela de login</title>
    <c:url value="/resources" var="Path"/>
	<link href="${Path}/css/cssTest.css" rel="stylesheet" type="text/css"  />
	<link rel="stylesheet" href="${Path}/css/bootstrap.min.css" /> 
	<script src="${Path}/js/jquery.min.js"></script>
	<script src="${Path}/js/popper.min.js"></script>  
	<script src="${Path}/js/bootstrap.min.js"></script>
	
	<style>
	body {
		  margin: 0;
		  padding: 0;
		  background-color: #17a2b8;
		  height: 100vh;
		}
		#login .container #login-row #login-column #login-box {
		  margin-top: 120px;
		  max-width: 600px;
		  height: 320px;
		  border: 1px solid #9C9C9C;
		  background-color: #EAEAEA;
		}
		#login .container #login-row #login-column #login-box #login-form {
		  padding: 20px;
		}
		#login .container #login-row #login-column #login-box #login-form #register-link {
		  margin-top: -85px;
		}	
	</style>
</head>
<%-- <body>
    <div class="container">
        <h1>Login do sistema aqui</h1>
        <form:form servletRelativeAction="/login" method="post">
            <div class="form-group">
                <label>Nome</label>
                <input type="text" name="username" class="form-control" />
            </div>
            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="password" class="form-control" />
            </div>
            <button type="submit" class="btn btn-primary">Logar</button>
        </form:form>
    </div>
</body>
 --%>

<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login do sistema aqui</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form:form id="login-form" cssClass="form" servletRelativeAction="/login" method="post">
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
                       
                        <c:forEach items="${usuarios }" var="usuario">
			<tr>
				<td> <a href="${s:mvcUrl('UC#detalhe').arg(0,usuario.userName).build()}" rel="nofollow">Usuário</a></td>
			</tr>
		</c:forEach>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>




</html>