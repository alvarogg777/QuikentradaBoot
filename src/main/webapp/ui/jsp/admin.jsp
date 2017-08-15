<%@page import="java.util.List"%>
<%@page import="es.fi.upm.gallego.model.Evento"%>
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 
    prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  
  <head>
    <meta charset="utf-8">
	<title>Admin view on Quikentrada</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style>
      body { padding-top: 60px; }
      td { padding:0 15px 0 15px; text-align: center;}
	  th { padding: 0 15px 0 15px; }
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
<% if(session.getAttribute("admin")==null)
	response.sendRedirect("../");%>
<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#">
            Quikentrada Eventos
          </a>
          <a style="position: absolute; right: 60px" class="brand" href="/">Cerrar Sesion
          </a>
        </div>
      </div>
    </div>
    <div class="container">
      <div>
        <h1>
          Eventos
        </h1>
      </div>
      <br/>
      <br/>
      
<table>
		<c:if test="${eventos!=null && eventos.size()>0}">

	<tr>
		<th>Nombre</th><th>Fecha</th><th>Localidad</th><th>Disponibilidad</th><th>Precio</th>
	</tr>
	<tr>
		<c:forEach items="${eventos}" var="evento">
		<tr>
		<td>${evento.nombre}</td><td>${evento.fecha}</td><td>${evento.localidad}</td><td>${evento.disponibilidad}</td><td>${evento.precio}</td> 
		<!-- <td><input type="button" value="Borrar" onclick="window.location.href='addClient.html?event=${evento.event_id}';"/></td>
		-->
		<td><a type="submit" class="btn" href="javascript:void(0)" onclick="<%session.setAttribute("admin","admin");%>borrar(${evento.event_id})">Borrar</a></td>
		<!-- 		<input type="button" value="Borrar" onclick="session.setAttribute("admin","admin"); borrar(${evento.event_id})"/></td> -->
		</tr>
		</c:forEach>
	</c:if>
</table>
<br>
		<a type="submit" class="btn" href="javascript:void(0)" onclick="window.location='addEvent.html';">Crear Evento</a>
		<a type="submit" class="btn" href="javascript:void(0)" onclick="window.location='getClients.html';">Listado de clientes</a>
		<a type="submit" class="btn" href="javascript:void(0)"  onclick="<%session.setAttribute("admin", "admin");%>window.location='getClientReports.html';">Grafico Ventas</a>
		
		<!-- 
		<button onclick="window.location='addEvent.html';">Crear Evento</button>
		<button onclick="window.location='getClients.html';">Listado de clientes</button>
		 -->
    </div>
	<script src="assets/js/bootstrap.js">
    </script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type="text/javascript">
    function borrar(evento){
   	 if(confirm("Se va a proceder a eliminar el evento, ¿deseas continuar?")){
   		 alert(evento)
   		 $.ajax({
   			type: 'POST',
   			url: 'http://localhost:8080/admin.html?evento='+evento,
   			success: function(data, textStatus, jqXHR){
   				alert('El evento fue eliminado correctamente');
   			},
   			error: function(jqXHR, textStatus, errorThrown){
   				alert('Se produjo un error al eliminar el evento: ' + textStatus);
   			}
   		});
    }
  }
    </script>
  </body>
</html>