<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>
    <meta charset="utf-8">
	<title>Admin view on Quikentrada</title>
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
		td { padding:0 15px 0 15px; }
		th { padding:0 15px 0 15px; }
	</style>
</head>
<body>
<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#">
            Quikentrada Clientes
          </a>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div>
        <h1>
          Clientes
        </h1>
      </div>
      <br/>
      <br/>
      
<table>
	<tr>
		<th>NIF</th><th>Apellido</th><th>Nombre</th>
	</tr>
	<c:forEach items="${clients}" var="client">
	<tr>
		<td align="center">${client.nif}</td><td align="center">${client.apellido},</td><td align="center">${client.nombre}</td>
		<td>
			<table>
				<tr> 
					<th align="left">ID Evento</th><th align="left">Nombre del evento</th><th align="left">Precio de la entrada</th>
				</tr>
				<c:forEach items="${client.payment}" var="payment">
					<tr>
						<td align="center">${payment.evento.event_id}</td><td align="center">${payment.evento.nombre}</td><td align="center">${payment.evento.precio}</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	</c:forEach>
</table>
	<br>
	<br>
	  <input type="submit" class="btn" id="btnCancel" onclick="<%session.setAttribute("admin", "admin");%>window.location='admin.html';" value="Volver"/>
	  <a type="submit" class="btn" href="javascript:void(0)"  onclick="<%session.setAttribute("admin", "admin");%>window.location='getClientReports.html';">Grafico Ventas</a>
	  
    </div>

    <script src="assets/js/bootstrap.js">
    </script>
  </body>
</html>