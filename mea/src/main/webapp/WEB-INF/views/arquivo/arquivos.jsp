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


<tags:pageTemplate titulo="Arquivos">

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
		    <tbody>
		    	<c:forEach items="${arquivos }" var="arquivo" >
			      <tr>
			      	<td><a class="word" href="${pageContext.request.contextPath}/${arquivo.arquivoPath}">${arquivo.nome }</a></td>
			        <td>${arquivo.descricao }</td>
			        <td class="dateToday" title="${ arquivo.dataUpload.time}">
			        	<fmt:formatDate pattern="dd/MM/yyyy" value="${ arquivo.dataUpload.time}"/>
			        </td> 
			        <td></td>
			      </tr>			      
	 		   </c:forEach>
		    </tbody>
	    
	   
	  </table>
	  <p><button onclick="sortTable()">Sort</button></p>
	  
	</div>

<script>
	var lista =[];
	lista = document.querySelectorAll('.dateToday');	
	var secondDate = new Date();
	secondDate.setHours(0,0,0,0);
	var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
	var cont = 0;
	lista.forEach(e => {		
		e = e.firstChild.nodeValue.trim().replace(/\b[/]/g, ',');
		let novo = new Date (e.slice(6, 10)+','+e.slice(3, 5)+','+e.slice(0, 2));
		let diffDays = Math.round(Math.abs((secondDate.getTime() - novo.getTime())/(oneDay)));
		lista[cont].textContent = 'há '+diffDays+' dias.';
		cont++;
	}); 
	
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