<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/resources" var="Path"/>
<script src="${Path}/js/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<form:form action="${ s:mvcUrl('AC#gravar').build() }" method="post" commandName="atividade" id="meuForm">
		<!-- a tag mvcUrl que gera uma URL de acordo com um determinado controller -->
		<!-- passarmos as iniciais PC para se referir a ProdutosController, o Spring já conseguirá fazer a relação entre os dois. -->
	    <!-- Precisamos passar uma segunda informação para a tag: o método para qual os dados serão enviados. Neste caso, o método será o gravar. -->
	    <!-- commandName, no qual podemos fazer uma referencia a qual entidade aquele formul�rio se refere. nesse caso, seria 
	    algo como: commandName="produto". Dessa forma, nas tags de erros (form:errors) não precisaremos colocar o prefixo produto.. Colocareamos então  só o nome do atributo. -->
	    <!-- enctype="multipart/form-data": É para enviar requisições multipart q podem fazer envios de arquivos, no caso, no sumário -->
		    
	    <div>
	        <label>Descrição</label>
	        <textarea rows="10" cols="20" name="descricao"></textarea>
	    </div>
	    <div>
	        <label>Data de Início</label>
	        <input type="text" name="dataInicio" />
	    </div>
		
	   
	   	<%-- <c:forEach items="${funcionarios}" varStatus="cont" >
	   		
		         <input type="checkbox" name="funcionarios[${cont.index}].nome" value="${funcionarios[cont.index].nome}">${funcionarios[cont.index].nome}<br>
		   
				
		</c:forEach> --%> 
		
		
		<%-- <select multiple name="funcionarios[0].nome">
			 <c:forEach items="${funcionarios}"  >
				<tr>
					 <option value="${funcionarios[0].nome}"  >
					 	${funcionarios[0].nome}
					 </option>
				</tr>
			</c:forEach> 	
		</select>  --%>
		
		
		<%-- <c:forEach items="${repFuncionarios}" varStatus="cont" >
			<div class="form-check">
			  <label class="form-check-label"  >
			    ${repFuncionarios[cont.index].nome}
			  </label>
			  <input class="form-check-input" type="checkbox"  name="func[${cont.index}].nome" value="${repFuncionarios[cont.index].nome}" id="check" onchange="desabilitar()" disabled />
						  
			</div>
		
		</c:forEach> --%>
		
		<div class="form-check">
			  <label class="form-check-label"  >
			    ${repFuncionarios[0].nome}
			  </label>
			  <input class="form-check-input" type="checkbox"  name="func[0].nome" value="${repFuncionarios[0].nome}" id="check" "  />
						  
		</div>
		
		
		
		<div class="form-check">
			  <label class="form-check-label"  >
			    ${repFuncionarios[2].nome}
			  </label>
			  <input class="form-check-input" type="checkbox"  name="func[2].nome" value="${repFuncionarios[2].nome}" id="check"   />
						  
		</div>
		
		
		
		
		<%-- <tr>
					
			<td > ${repFuncionarios[0].nome}</td>
			<input type="type" name="func[1].nome" value="${repFuncionarios[0].nome}">
			 --%>
		</tr>  
			<button type="submit" class="btn btn-primary submitForm" >Cadastrar</button>
		</form:form>
		
	<script type="text/javascript">
	//function desabilitar () {
			/* alert('ddd');
	        
	       // for(var i=0 ; i<6; i++){
	        	var nomecheck = document.querySelector('#check');
	        	if(nomecheck.checked == false){
	        		alert('aqui');
	        		nomecheck.disabled = true;
	        		if(nomecheck.disabled == true){
	        			alert('aqui2');
	        		}
	        		
	        	}
	        	console.log(nomecheck.checked == true);
	        	alert('acabou.'); */
	        //}
	        
	        /* if(nomecheck.unChecked ) {
	        	alert('aqui');
	        	nomecheck.disabled = true;
	        }  */
	        
	        var el = document.getElementById('check2');
	        el.remove(); // Remove o div com o id 'div-02'
	       
			
	//}
		
		    
	</script>
</body>
</html>