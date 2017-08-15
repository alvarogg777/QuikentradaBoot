<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!-- page enconding ISO-8859-1 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
    <style>
		.error {
			color: #ff0000;
		}
		
		.errorblock {
			color: #000;
			background-color: #ffEEEE;
			border: 3px solid #ff0000;
			padding: 8px;
			margin: 16px;
		}
	</style>
  </head>
  <body>
    <div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#">
            Proceso de compra
          </a>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div>
        <h1>
          Buy tickets with Quikentrada
        </h1>
        <p>
          Por favor, ingrese sus datos personales:
          <br>
          &nbsp;
        </p>
      </div>
      <form:form commandName="cliente" id="myForm">
		<form:errors path="*" cssClass="errorblock" element="div" />
			<label for="textinput1">
	          Nombre:
	        </label>
			<form:input path="nombre" cssErrorClass="error" pattern="\\w{3}\w*" title="debe contener al menos 3 caracteres" required="true"/>
			<form:errors path="nombre" cssClass="error" />
			<label for="textinput1">
	          Apellidos:
	        </label>			
			<form:input path="apellido" cssErrorClass="error" pattern="\\w{3}\w*" title="debe contener al menos 3 caracteres" required="true"/>
			<form:errors path="apellido" cssClass="error" />
			<label for="textinput1">
	          Identificador fiscal (NIF/CIF/NIE)*:
	        </label>	
			<form:input path="nif" cssErrorClass="error" pattern="\\d{8}\w" placeholder="8 digitos y una letra" title="debe contener 8 digitos y una letra" required="true"/>
			<form:errors path="nif" cssClass="error" />
			<label for="textinput1">
	          Email:
	        </label>
	        <!--
			<form:input path="email" cssErrorClass="error" pattern="[a-z0-9._%+-]+@upm\.es$" placeholder="xxxxxxx@upm.es"/>
			<form:errors path="email" cssClass="error" />
			  -->
			<form:input path="email" type="email" id="email" pattern="[a-z0-9._%+-]+@upm\.es$" placeholder="xxxxxxx@upm.es" title="please your email must match the expression: xxxx@upm.es" required="true"/>
			<form:errors path="nif" cssClass="error" />
			<label for="textinput1">
	          Por favor, repita su email:
	          </label>
			<input type="email" id="email2" pattern="[a-z0-9._%+-]+@upm\.es$" placeholder="xxxxxxx@upm.es" title="please your email must match the expression: xxxx@upm.es" required/>
			<script type="text/javascript">
			</script>
			<br/>
			<input type="submit" class="btn" value="Continuar" disabled/>
			
	  </form:form>
     
     <input type="submit" class="btn"  onclick="window.location='getEvents.html';" value="Cancelar"/>
     
      <div class="control-group">
      </div>
    </div>


    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type="text/javascript">	
	$('#myForm').change(function compareEmail(){
		if(/^[a-z0-9._%+-]+@upm\.es$/.test($("#email").val())&&/^[a-z0-9._%+-]+@upm\.es$/.test($("#email").val())&&/^\d{8}\w$/.test($("#nif").val())&&$('#email').val()==$('#email2').val()&&$('#nombre').val().length>2&&$('#apellido').val().length>2)
			$('input[type="submit"]').prop('disabled',false);	
			
		});
	</script>
  </body>
</html>