<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="es.fi.upm.gallego.model.Evento"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 
    prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
  
  <head>
    <meta charset="utf-8">
<title>Eventos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style>
      body { padding-top: 60px; }
      td { padding:0 15px 0 15px; text-align: center;}
	  th { padding: 0 15px 0 15px; }
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
<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#">Quikentrada eventos
          </a>
          <a style="position: absolute; right: 60px" class="brand" href="/">Home
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
      <br/><table>
		<c:if test="${eventos!=null && eventos.size()>0}">
		
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<script type="text/javascript"> var eventos=[]; var i=0; var eventList;
		</script>
	<form name="form1">
	<input type="text" id="searchKeyNombre" placeholder="Nombre del evento"/>
	<input type="text" id="searchKeyFecha" placeholder="Dia del evento: DD/MM/YYYY"/>
	<input type="text" id="searchKeyLocalidad" placeholder="Localidad del evento"/>
	<a type="submit" class="btn" href="javascript:void(0)" onclick="buscar()" style="position:absolute; padding: 5x 10px 0px 5px;">Buscar</a>
	
	</form>
	<br><br>
	<div class="row">
		<ul id="eventList"></ul>
	</div>
		<% List<Evento> even=new ArrayList<Evento>();
		even=(List<Evento>)session.getAttribute("eventos");
			ListIterator<Evento> list_eventos=even.listIterator();
			Evento e=new Evento();
			%>
			<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<script type="text/javascript">
		var a=0;
		var eventList = $("#eventList").clone();
		$('#eventList').append('<tr><th> </th><th>Nombre</th><th>Fecha</th><th>Localidad</th><th>Disponibilidad</th><th>Precio</th><th>Tipo</th><th> </th></tr>')

		</script>
	<c:forEach items="${eventos}" var="evento" varStatus="i">
		<%e=list_eventos.next(); //out.println(e.getNombre());%>
		<input id="id_evento${i.index}" value="<%=e.getEvent_id()%>" type="hidden"/>
		<input id="nombre_evento${i.index}" value="<%=e.getNombre()%>" type="hidden"/>
		<input id="fecha_evento${i.index}" value="<%=e.getFecha()%>" type="hidden"/>
		<input id="localidad_evento${i.index}" value="<%=e.getLocalidad()%>" type="hidden"/>
		<input id="disponibilidad_evento${i.index}" value="<%=e.getDisponibilidad()%>" type="hidden"/>
		<input id="precio_evento${i.index}" value="<%=e.getPrecio()%>" type="hidden"/>
		<input id="tipo_evento${i.index}" value="<%=e.getTipo()%>" type="hidden"/>
		<input id="img_evento${i.index}" value="<%=e.getImg()%>" type="hidden"/>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<script type="text/javascript">
		var ind=${i.index}; var forma='#id_evento'+ind
		var id_evento=$(forma).val(); forma='#nombre_evento'+ind
		var nombre_evento=$(forma).val(); forma='#fecha_evento'+ind
		var fecha_evento=$(forma).val(); forma='#localidad_evento'+ind
		var localidad_evento=$(forma).val(); forma='#disponibilidad_evento'+ind
		var disponibilidad_evento=$(forma).val(); forma='#precio_evento'+ind
		var precio_evento=$(forma).val(); forma='#tipo_evento'+ind
		var tipo_evento=$(forma).val(); forma='#img_evento'+ind
		var img_evento=$(forma).val(); //if(img_evento==null)img_evento="http://valenciabonita.es/wp-content/uploads/2015/12/concierto-rsm.jpg"
		var evento=[id_evento,nombre_evento,fecha_evento,localidad_evento,disponibilidad_evento,precio_evento,tipo_evento,img_evento]
		eventos[i]=evento
		//alert('i: '+i+' evento[i]: '+eventos[i]+' evento_curr: '+evento)
		i++;
		//var a=0;
		//while(a<i){

		$('#eventList').append('<tr><td><img src='+eventos[a][7]+' width="200" length="200"></td><td>'+eventos[a][1]+'</td>'+'<td>'+eventos[a][2]+'</td>'+'<td>'+eventos[a][3]+'</td>'+
				'<td>'+eventos[a][4]+'</td><td>'+eventos[a][5]+'</td><td>'+eventos[a][6]+'</td>')
			if(eventos[a][4]>0)
				$('#eventList').append('<td><a type="submit" class="btn" href="javascript:void(0)" onclick="window.location.href=\'addClient.html?event='+eventos[a][0]+'\';">Comprar</a></td></tr>')
			else
				$('#eventList').append('<td><a type="submit" class="btn" href="javascript:void(0)" onclick="window.location.href=\'addClient.html?event='+eventos[a][0]+'\';" disabled>Comprar</a></td></tr>')

		a++;
		//}
		</script>
		</c:forEach>
	</c:if>
</table>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script type="text/javascript">
	function buscar(){
	var filtro_nombre=$('#searchKeyNombre').val()
	var filtro_fecha=$('#searchKeyFecha').val()
	var filtro_localidad=$('#searchKeyLocalidad').val()
	var regExp_nombre=new RegExp(filtro_nombre,'gi')
	var regExp_fecha=new RegExp(filtro_fecha,'gi')
	var regExp_localidad=new RegExp(filtro_localidad,'gi')
	$("#eventList").replaceWith(eventList.clone());
	$('#eventList').append('<tr><th> </th><th>Nombre</th><th>Fecha</th><th>Localidad</th><th>Disponibilidad</th><th>Precio</th><th>Tipo</th><th> </th></tr>')

	var a=0
		while(a<i){
			//alert(filtro_nombre+' '+eventos[a][0]+' :'+eventos[a][0].match(regExp_nombre))
			if((eventos[a][1].match(regExp_nombre))&&(eventos[a][2].match(regExp_fecha))&&(eventos[a][3].match(regExp_localidad))){
//				document.write(nombre_evento);		
				//alert('FOUND '+a+': '+eventos[a][0])
				//$('#eventList').append('<tr><td style="width: 220px; height:220px"<a href="#">"<img src="http://edmmaniac.com/wp-content/uploads/2015/11/tomorrowland-2015-videos-live-dj-sets.jpg"/></a></td></tr>')
				$('#eventList').append('<tr><td><img src='+eventos[a][7]+' width="200" length="200"></td><td>'+eventos[a][1]+'</td>'+'<td>'+eventos[a][2]+'</td>'+'<td>'+eventos[a][3]+'</td>'+
						'<td>'+eventos[a][4]+'</td><td>'+eventos[a][5]+'</td><td>'+eventos[a][6]+'</td>')
						if(eventos[a][4]>0)
					$('#eventList').append('<td><a type="submit" class="btn" href="javascript:void(0)" onclick="window.location.href=\'addClient.html?event='+eventos[a][0]+'\';">Comprar</a></td></tr>')
						else
						$('#eventList').append('<td><a type="submit" class="btn" href="javascript:void(0)" onclick="window.location.href=\'addClient.html?event='+eventos[a][0]+'\';" disabled>Comprar</a></td></tr>')
						
			}
			a++;
		}
	//$('#eventList').append('</tr>')
	};	
	
	
	</script>
    </div>
<!-- <script type="text/javascript">
	window.onload = function() {
	    var c=document.getElementById("canvas0");
	    var ctx=c.getContext("2d");
	    var img=new Image();
	    img.src="http://vignette1.wikia.nocookie.net/blink182universe/images/b/b2/Blink1.gif/revision/latest?cb=20111106054526";
	    ctx.drawImage(img,10,10);
	};
	</script> -->	
    <script src="assets/js/bootstrap.js">
    </script>
  </body>
</html>