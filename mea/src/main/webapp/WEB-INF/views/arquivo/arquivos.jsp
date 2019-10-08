<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.css" />
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.css">
 
 <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.js"></script>

<style>
	
	body { display:none; }
	
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
    	bottom: 15px;
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
    width: 60px;
    height: 40px;
    display: inline-block;
    margin: auto;
    position: relative;
    background-color: #708090;
    border-radius: 0 3px 3px 3px;
    /*box-shadow: 4px 4px 7px rgba(0, 0, 0, 0.59);*/
    margin-bottom: -8px;
    margin-top: 12px;
  }
  
  .f2 {
  	width: 20px;
    height: 15px;
    position: relative;
    	bottom: 10px;
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
  
  h4 {
  	margin-top: 20px !important;
  	font-size: 1rem !important;
  	margin-left: 5%;
  	max-width: 10%;
  		
  }
  
  .col-lg-4 {
  	max-width: 10% !important;
  	min-width: 5% !important;
  	margin: 0 2%;
  	cursor: pointer; 
  }
  
  .fa-trash{
  	cursor: pointer; 
  }
  
  #myInput{
  	margin-bottom: 20px;
  }
  
  #testeModal{
  	z-index: 1200;
  }
  
  #meuModal{
  	z-index: 1100;
  }
  
  .modal-dialog{
    overflow-y: initial !important
	}
  .modal-body{
    height: 500px;
    overflow-y: auto;
  }
  
  .navbar-icon-top .navbar-nav .nav-link > .fa {
	  position: relative;
	  width: 36px;
	  font-size: 24px;
	}
	
	.navbar-icon-top .navbar-nav .nav-link > .fa > .badge {
	  font-size: 0.75rem;
	  position: absolute;
	  right: 0;
	  font-family: sans-serif;
	}
	
	.navbar-icon-top .navbar-nav .nav-link > .fa {
	  top: 3px;
	  line-height: 12px;
	}
	
	.navbar-icon-top .navbar-nav .nav-link > .fa > .badge {
	  top: -10px;
	}
	
	@media (min-width: 576px) {
	  .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link {
	    text-align: center;
	    display: table-cell;
	    height: 70px;
	    vertical-align: middle;
	    padding-top: 0;
	    padding-bottom: 0;
	  }
	
	  .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link > .fa {
	    display: block;
	    width: 48px;
	    margin: 2px auto 4px auto;
	    top: 0;
	    line-height: 24px;
	  }
	
	  .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link > .fa > .badge {
	    top: -7px;
	  }
	}
	
	@media (min-width: 768px) {
	  .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link {
	    text-align: center;
	    display: table-cell;
	    height: 70px;
	    vertical-align: middle;
	    padding-top: 0;
	    padding-bottom: 0;
	  }
	
	  .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link > .fa {
	    display: block;
	    width: 48px;
	    margin: 2px auto 4px auto;
	    top: 0;
	    line-height: 24px;
	  }
	
	  .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link > .fa > .badge {
	    top: -7px;
	  }
	}
	
	@media (min-width: 992px) {
	  .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link {
	    text-align: center;
	    display: table-cell;
	    height: 70px;
	    vertical-align: middle;
	    padding-top: 0;
	    padding-bottom: 0;
	  }
	
	  .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link > .fa {
	    display: block;
	    width: 48px;
	    margin: 2px auto 4px auto;
	    top: 0;
	    line-height: 24px;
	  }
	
	  .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link > .fa > .badge {
	    top: -7px;
	  }
	}
	
	@media (min-width: 1200px) {
	  .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link {
	    text-align: center;
	    display: table-cell;
	    height: 70px;
	    vertical-align: middle;
	    padding-top: 0;
	    padding-bottom: 0;
	  }
	
	  .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link > .fa {
	    display: block;
	    width: 48px;
	    margin: 2px auto 4px auto;
	    top: 0;
	    line-height: 24px;
	  }
	
	  .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link > .fa > .badge {
	    top: -7px;
	  }
	}
	
</style>
<tags:pageTemplate titulo="Arquivos">
  	
  	<%-- <span><div class="file"></div></span> --%>
  	 
	 
	  
	 <div class="container marketing" >
 		<div class="row">
 			<c:forEach items="${pastas }" var="pasta" varStatus="cont">
				<div class="col-lg-4">	
					<a data-toggle="modal" data-target="#meuModal" onclick="folderSelection('${pasta.nome }')"><span><div class="folder"></div></span></a>
					<h4>${pasta.nome }</h4>
					
				</div>
			</c:forEach>
		</div>
	</div>					
	

	<!-- The Modal -->
	<div class="modal" id="meuModal" >
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	      	
	        <div class="container modal-body">
		       <%--  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				   <a class="navbar-brand" href="#">
				    <img src="${pageContext.request.contextPath}/resources/arquivos/fotos/bird.jpg" alt="Logo" style="width:40px;">
				   </a>
				   <a class="navbar-brand" href="#">
				   	<i class="fa fa-sort" onclick="sortTable()"></i>
				    <!-- <p><button onclick="sortTable()">Organizar</button></p> -->
				   </a>
				   <a class="navbar-brand" href="#">
				    <div id="direciona"></div>
				   </a>
				   <a class="navbar-brand" href="#">
				    <i class="fa fa-trash" id="aa" ></i>
				   </a>
				   <a class="navbar-brand" href="#">
				    <input type="text" id="myInput" onkeyup="search()" placeholder="Procurar arquivo..." title="Type in a name">
				   </a>
				</nav>  --%>
				<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
				  <a class="navbar-brand" href="#">
				    <img src="${pageContext.request.contextPath}/resources/arquivos/fotos/bird.jpg" alt="Logo" style="width:40px;">
				   </a>
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>
				
				  <div class="collapse navbar-collapse" id="navbarSupportedContent">
				    <ul class="navbar-nav mr-auto">
				       <li class="nav-item" onclick="sortTable()">
					      <a class="nav-link" href="#">
						      <i class="fa fa-sort" >
						      </i>
						      Organizar
					      </a>
				      </li>
				      <li class="nav-item">
				        <div id="direciona"></div>
				        
				      </li>
					  <li class="nav-item" id="aa">
					      <a class="nav-link" href="#">
						      <i class="fa fa-trash" >
						      </i>
						      Deletar Tudo
					      </a>
				      </li>
				      <%--    <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          <i class="fa fa-envelope-o">
				            <span class="badge badge-primary">11</span>
				          </i>
				          Dropdown
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <a class="dropdown-item" href="#">Action</a>
				          <a class="dropdown-item" href="#">Another action</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="#">Something else here</a>
				        </div>
				      </li>
				    </ul>
				    <ul class="navbar-nav ">
				      <li class="nav-item">
				        <a class="nav-link" href="#">
				          <i class="fa fa-bell">
				            <span class="badge badge-info">11</span>
				          </i>
				          Test
				        </a>
				      </li> --%>
				     
				    </ul>
				    <form class="form-inline my-2 my-lg-0">
				      <input class="form-control mr-sm-2" type="text" id="myInput" onkeyup="search()" placeholder="Procurar arquivo..." aria-label="Search">
				    </form>
				  </div>
				</nav>
			  
			  
			  
<%-- 			  <a class="nav-link" href="${pageContext.request.contextPath}/arquivo/formArquivo">cadastro de arquivos</a>
 --%>		  
 			  	 
			  <table class="table">
			    	 
			    	 <thead class="thead-dark">
				      <tr>
				      	<th>Tipo</th>
				        <th>Nome do Arquivo</th>
				        <th>Descrição</th>
				        <th>Último upload</th>
				        <th></th>
				        <th></th>
				      </tr>
				    </thead>
				    <tbody id="body44">
				    </tbody>
			  </table>			  
			</div>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal" id="testeModal"></div>
	
<script>
		
	var fileList = [];
		$.get("${pageContext.request.contextPath}/arquivo/pasta",	{	
			 }
		      ,	function(response) {	
		    	  fileList = response;
		      });
		
	document.querySelector("body").style.display = "block";
			
		
	var secondDate = new Date();
	secondDate.setHours(0,0,0,0);
	var oneDay = 24*60*60*1000;
	
	var gato;

    function folderSelection(pasta){
    	var sideFolder = pasta.split(' ').join('+');
    	console.log('sidefolder: '+sideFolder);
    	
    	var folderList = fileList
		.filter(e => e.pasta.nome == pasta);
    	
    	//var pasta = pasta;
    	
    	document.querySelector('#direciona').innerHTML= 
    	`	
    		
    		<a class="nav-link" href=${pageContext.request.contextPath}/arquivo/formArquivo/?pasta=`+sideFolder+`>
	          <i class="fa fa-file"></i>
	          
	          Novo Arquivo
	          <span class="sr-only">(current)</span>
	        </a>
    	` ;
    	/*  `
    		<a class="nav-link" href=${pageContext.request.contextPath}/arquivo/formArquivo/`+pasta+`>cadastrar arquivo</a> 
    	` ; */
    	
    	
   		document.querySelector('#body44').innerHTML = 
   			folderList.map((e) => { 
  					let current = new Date(e.dataUpload);
  					current.setHours(0,0,0,0);
  					var diffDays = Math.round(Math.abs((secondDate.getTime() - current.getTime()) / (oneDay)));
  					gato = e.pasta.nome;
  					var sideName = e.pasta.nome.split(' ').join('+');
  					
   				return `
    				<tr>
   						
   						<td >
   							<span><div class="file" title="arquivo"></div></span>
   						</td>
   						<td><a href=${pageContext.request.contextPath}/`+e.arquivoPath+`>`+e.nome+`</a></td>
   						<td>`+e.descricao+`</td>
   						<td>`+(diffDays != 1 ? diffDays+' dias atrás' : diffDays+' dia atrás')+`</td>
   						<td>
   							<i class="fa fa-trash" aria-hidden="true" onclick=novoModal(`+e.id+`,'`+sideName+`')></i>
   						</td>
   						<td>
   						<input type="checkbox" id="scales" value=`+e.id+`>
						</td>
   					</tr>
  						`
   			}).join('');
    		
    		console.log(gato);
    		
	    	document.getElementById("aa").addEventListener('click', function(){
	    		
	    		
	    		var a = document.querySelectorAll('#scales');
	    		//console.log('teste:> '+a[0].value);
	    		// console.log(a);
	    		var allChecked = [];
	    		
	    		for(var i = 0, j = 0; i < a.length; i++){
	    			if(a[i].checked == true){
    					allChecked[j] = a[i].value;
    					j++;
    				}
		    	} 
	    		
	    		if(allChecked.length > 0) {
	    			novoModal(allChecked, gato);
	    		}
	    	});
	    	
    	}
    
	 
	 function novoModal(array, pasta){
		pasta = pasta.split('+').join(' ');

		$('#testeModal').modal();
		document.querySelector('#testeModal').innerHTML = 			
			`
			  <div class="modal-dialog modal-sm">
			    <div class="modal-content">
			      <!-- Modal Header -->
			      <div class="container">
			      	<div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			       		<h5 class="modal-title">`+(array.length > 1 ? 'Você realmente deseja excluir estes '+array.length+' itens?' : 'Você realmente deseja excluir este item?')+`</h5>
					<div class="modal-footer">
 						<button type="button" id="push" class="btn btn-success" >Sim</button> 
 						<button type="button" data-dismiss="modal" class="btn btn-danger" >Não</button>
			      	</div>
			      </div>
			    </div>
			  </div>
			
			`;
		document.querySelector(".btn-success").focus();
		document.querySelector("#push").addEventListener('click', function(){
			deletar(array, pasta);
		});
	}
	 
	 function deletar(input, pasta){
			let arrayTemp = [];
			
			if(typeof input == 'number'){
				arrayTemp[0] = input;
				console.log('aqui: '+arrayTemp[0]);
			} else {
				arrayTemp = input;
			}
			
			console.log('aqui: '+arrayTemp[0]);
			
			var id = [];
			for(var i = 0; i < arrayTemp.length; i++){
				id[i] = parseInt(arrayTemp[i]);
			}
			
			jQuery.ajaxSettings.traditional = true;			 
			
			 $.get("${pageContext.request.contextPath}/arquivo/deletar",	{id: id}
		      ,	function(response) {	
		    	  fileList = response;
		    	  folderSelection(pasta);
		    	  console.log(fileList);
		      }); 
		    $('#testeModal').modal('hide');
			 
		 }
	 
	function search(){
		 var input, filter, table, tr, td, i, txtValue;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  console.log("input: "+input.value.toUpperCase())
		  table = document.querySelector(".table");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[1];
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
		      
		      

		      x = parseInt(rows[i].getElementsByTagName("TD")[3].textContent.replace(/\D/g, ''));
		      y = parseInt(rows[i + 1].getElementsByTagName("TD")[3].textContent.replace(/\D/g, ''));
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