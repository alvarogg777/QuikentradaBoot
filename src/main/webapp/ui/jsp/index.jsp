
<%@page import="java.util.Scanner"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  
  <head>
    <meta charset="utf-8">
    <title>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style>
      body { padding-top: 60px; /* 60px to make the container go all the way
      to the bottom of the topbar */ }
   .black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index:1001;
        -moz-opacity: 0.8;
        opacity:.80;
        filter: alpha(opacity=80);
    }
    .white_content {
        display: none;
        position: absolute;
        top: 25%;
        left: 35%;
        width: 20%;
        height: 50%;
        padding: 16px;
        border: 8px solid orange;
        background-color: white;
        z-index:1002;
        overflow: auto;
    }
    
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js">
      </script>
    <![endif]-->
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
  </head>
  <body>
	Message: ${message}
  <%request.removeAttribute("admin");
  session.removeAttribute("admin");%>
    <div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
        <a class="brand" id="login" href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
            Modo Administrador        
 			</a>
	  		
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="hero-unit">
        <div>
          <h1>
            Bienvenido a Quikentrada!
          </h1>
          <p>
            Quikentrada es un servicio exclusivo de venta online de entradas.
          </p>
        </div>
        <a class="btn btn-primary" href="getEvents.html">
          Acceder al sitio >>
        </a>
      </div>
      <div>
      </div>
    </div>
	<div id="light" class="white_content">
  <div id="dialog" title="Dialog Form">
		<form action="http://localhost:3000/admin.html" method="get" id="myForm">
			<b>Identifiquese para continuar:</b>
			<br>
			<label>ID:</label>
			<input id="nif" type="text">
			<label>Password:</label>
			<input id="password" type="password">
			<br>
			<a class="btn" type="submit"  href = "javascript:void(0)" onclick="validateLogin()">Validar</a>
		</form>
	</div>
	 <a class="btn" href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Cancelar</a></div>
	
	 <div id="fade" class="black_overlay"></div>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <script type="text/javascript">
  function validateLogin(){
	  var nif=$('#nif').val();
	  var pass=$('#password').val();
	  
	 if(nif=='admin'&&pass=='admin'){
  		  //alert(nif+' '+pass);
  		  
			 $.ajax({
		   			type: 'POST',
		   			url: 'http://localhost:3000/index.html',
		   		//	dataType: 'json',
		   			contentType: "application/json",
		   			data: JSON.stringify({ 			
		   				"nif": nif,
		   				"pass": pass}),
		   			success: function(data, textStatus, jqXHR){
		   				//alert('Administrador identificado correctamente');
		 //  				window.location.href = "http://localhost:8080/UPMSocial/";

		   				$('#myForm').submit();
		   			},
		   			error: function(jqXHR, textStatus, errorThrown){
		   				alert('Datos incorrectos: ' + textStatus);

		   				$('#myForm').submit();
		   			}
		   		});
	 }
	 else
		 alert('Datos incorrectos: ' + textStatus);

  		//$('#myForm').submit();

//		$('#myForm').submit();
  }
	
  </script>
  </body>
</html>
