<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

 <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.css" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.js"></script>

<style>
	.file {
    background:#eee;
    background:-moz-linear-gradient(top, #ddd 0, #eee 15%, #fff 40%, #fff 70%, #eee 100%);
    background:-webkit-linear-gradient(top, #ddd 0, #eee 15%, #fff 40%, #fff 70%, #eee 100%);
    border:1px solid #ccc;
    -moz-border-radius:3px 15px 3px 3px;
    -webkit-border-radius:3px 15px 3px 3px;
    border-radius:3px 15px 3px 3px;
    -moz-box-shadow:inset rgba(255,255,255,0.8) 0 1px 1px;
    -webkit-box-shadow:inset rgba(255,255,255,0.8) 0 1px 1px;
    box-shadow:inset rgba(255,255,255,0.8) 0 1px 1px;
    display: inline-block;
    width: 20px;
    height: 25px;
    position:relative;
    text-indent:-9999em;
    margin-bottom: -8px;
    margin-top: 12px;
  }
  .file:before {
    content: '';
    position: absolute;
    right:0;
    width: 10px;
    height: 10px;
    background:#ccc;
    background:-moz-linear-gradient(45deg, #fff 0,  #eee 50%, #ccc 100%);
    background:-webkit-linear-gradient(45deg, #fff 0,  #eee 50%, #ccc 100%);
    box-shadow:rgba(0,0,0,0.05) -1px 1px 1px, inset white 0 0 1px;
    border-bottom:1px solid #ccc;
    border-left:1px solid #ccc;
    -moz-border-radius:0 14px 0 0;
    -webkit-border-radius:0 14px 0 0;
    border-radius:0 10px 0 0;
  }

  .file:after {
    content:"";
    display:block;
    position:absolute;
    left:0;
    top:0;
    width: 40%;
    margin: 10px 20% 0;
    background:#ccc;
    background:-moz-linear-gradient(top, #ccc 0, #ccc 20%, #fff 20%, #fff 40%, #ccc 40%, #ccc 60%, #fff 60%, #fff 80%, #ccc 80%, #ccc 100%);
    background:-webkit-linear-gradient(top, #ccc 0, #ccc 20%, #fff 20%, #fff 40%, #ccc 40%, #ccc 60%, #fff 60%, #fff 80%, #ccc 80%, #ccc 100%);
    height: 8px;
  }


  .folder {
    width: 30px;
    height: 20px;
    display: inline-block;
    margin: auto;
    position: relative;
    background-color: #708090;
    border-radius: 0 3px 3px 3px;
    /*box-shadow: 4px 4px 7px rgba(0, 0, 0, 0.59);*/
    margin-bottom: -8px;
    margin-top: 12px;
  }

  .folder:before {
    content: '';
    width: 50%;
    height: 0.2em;
    border-radius: 0 20px 0 0;
    background-color: #708090;
    position: absolute;
    top: -0.2em;
    left: 0px;
  }
	
</style>
<tags:pageTemplate titulo="Arquivos">
  	
  	<span><div class="file"></div></span>
	
	<a href="https://www.google.com/"><span><div class="folder"></div></span></a>
	
	<a class="nav-link" href="${pageContext.request.contextPath}/arquivo/formArquivo">cadastro de arquivos</a>

	<div class="container">
	  <h2>Arquivos</h2>
	  <p>espaço para descrição</p>
	  
	  <input type="text" id="myInput" onkeyup="search()" placeholder="Search for names.." title="Type in a name">
	  
	  <table class="table">
	    
	    	 <thead class="thead-dark">
		      <tr>
		        <th>Nome do Arquivo</th>
		        <th>Descrição</th>
		        <th>Último upload</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody id="body44">
		    	
		    </tbody>
	    
	   
	  </table>
	  <p><button onclick="sortTable()">Sort</button></p>
	  
	</div>
	
	<div id="ff" onclick="teste('Pasta1')">clica aqui</div>
	
	<td class="dateToday" title="${ arquivo.dataUpload.time}">
				        	<fmt:formatDate pattern="dd/MM/yyyy" value="${ arquivo.dataUpload.time}"/>
				        </td> 

<script>

	
	var fileList = [];
		$.get("${pageContext.request.contextPath}/arquivo/pasta",	{	
			 }
		      ,	function(response) {	
		    	  fileList = response;
		      });
		
		var secondDate = new Date();
		var oneDay = 24*60*60*1000;
		

    function teste(pasta){
    	var folderList = fileList
    		.filter(e => e.pasta.nome == pasta);
    	
    		document.querySelector('#body44').innerHTML = 
    			folderList.map((e) => { 
   					let current = new Date(e.dataUpload);
   					var diffDays = Math.round(Math.abs((secondDate.getTime() - current.getTime()) / (oneDay)));
   					console.log('e path: '+typeof e.arquivoPath);
    				return `
	    				<tr>
    						<td><a href=${pageContext.request.contextPath}/`+e.arquivoPath+`>`+e.nome+`</a></td>
    						<td>`+e.descricao+`</td>
    						<td>`+(diffDays != 1 ? diffDays+' dias atrás' : diffDays+' dia atrás')+`</td>
    					</tr>
   						`
    				
    			}).join('');
    }
	    		
   // <td><a href="${pageContext.request.contextPath}/resources/arquivos/doc/ash.png">`+e.nome+`</a></td>	
	    /* `<tr>
		<td>`+e.dataUpload.time+`</td>
		<td>`+e.descricao+`</td>
		<td class="dateToday" >
    		asdf
    	</td> 
	 </tr>` */
	    		
	    		
	    		
	    		
		
		//<td><a class="word" href="${pageContext.request.contextPath}/${arquivo.arquivoPath}">f.nome</a></td>
	    
		/* var b = ${arquivo.pasta.nome == 'Pasta2'};
		document.querySelector("#body44").innerHTML =
		
			`<c:forEach items="${arquivos }" var="arquivo" >
				<c:set var = "gg" value = "pasta"/>
			    <c:if test="${arquivo.pasta.nome == pasta}">
			      	  <tr>
				      	<td><a class="word" href="${pageContext.request.contextPath}/${arquivo.arquivoPath}">${arquivo.nome }</a></td>
				        <td>${arquivo.descricao }</td>
				        <td class="dateToday" title="${ arquivo.dataUpload.time}">
				        	<fmt:formatDate pattern="dd/MM/yyyy" value="${ arquivo.dataUpload.time}"/>
				        </td> 
				        <td></td>
				      </tr>	
			    </c:if>var secondDate = new Date();
			 </c:forEach> ` */

      <%-- <tr>
      	<td><a class="word" href="${pageContext.request.contextPath}/${arquivo.arquivoPath}">${arquivo.nome }</a></td>
        <td>${arquivo.descricao }</td>
        <td class="dateToday" title="${ arquivo.dataUpload.time}">
        	<fmt:formatDate pattern="dd/MM/yyyy" value="${ arquivo.dataUpload.time}"/>
        </td> 
        <td></td>
      </tr>	 --%>		      
	   	
	
	
	/* var lista =[];
	lista = document.querySelectorAll('.dateToday');	
	var secondDate = new Date();
	secondDate.setHours(0,0,0,0);
	var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
	var cont = 0;
	lista.forEach(e => {	
		console.log("e: "+e);
		e = e.firstChild.nodeValue.trim().replace(/\b[/]/g, ',');
		let novo = new Date (e.slice(6, 10)+','+e.slice(3, 5)+','+e.slice(0, 2));
		let diffDays = Math.round(Math.abs((secondDate.getTime() - novo.getTime())/(oneDay)));
		lista[cont].textContent = 'há '+diffDays+' dias.';
		cont++;
	});  */
	
	function search(){
		 var input, filter, table, tr, td, i, txtValue;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  console.log("input: "+input.value.toUpperCase())
		  table = document.querySelector(".table");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    console.log('td: '+td);
		    if (td) {
		    	console.log("aqui");
		      txtValue = td.textContent || td.innerText;
		      console.log('indexof: '+txtValue.toUpperCase().indexOf(filter));
		      if (txtValue.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }       
		  }
	}
	
	function sortTable() {
		  var table, rows, switching, i, x, y, shouldSwitch;
		  table = document.querySelector(".table");
		  switching = true;
		  /*Make a loop that will continue until
		  no switching has been done:*/
		  while (switching) {
		    //start by saying: no switching is done:
		    switching = false;
		    rows = table.rows;
		    /*Loop through all table rows (except the
		    first, which contains table headers):*/
		    for (i = 1; i < (rows.length - 1); i++) {
		      //start by saying there should be no switching:
		      shouldSwitch = false;
		      
		      //esse [0] depois do ("TD") significa a coluna que vc vai pegar
		      console.log('x'+i+': '+rows[i].getElementsByTagName("TD")[2].textContent)
		      console.log('y'+(i+1)+': '+rows[i + 1].getElementsByTagName("TD")[2].textContent)
		      
		      

		      x = parseInt(rows[i].getElementsByTagName("TD")[2].textContent.replace(/\D/g, ''));
		      y = parseInt(rows[i + 1].getElementsByTagName("TD")[2].textContent.replace(/\D/g, ''));
		      //compara os elementos de uma linha e a que vem depois dela
		      /*x = rows[i].getElementsByTagName("TD")[0];
		      y = rows[i + 1].getElementsByTagName("TD")[0];*/


		      
		      console.log('xxxxxxx:? '+ x)
		      
		      //check if the two rows should switch place:
		      /* if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) { */
			  if (x > y) { 			   
		        //if so, mark as a switch and break the loop:
		        shouldSwitch = true;
		        break;
		      } 
		    }
		    if (shouldSwitch) {
		      /*If a switch has been marked, make the switch
		      and mark that a switch has been done:*/
		      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
		      switching = true;
		    }
		  }
		}
</script>

</tags:pageTemplate>