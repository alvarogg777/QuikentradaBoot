<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 
    prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<script type="text/javascript"> var sales=[]; var i=0;
		</script>
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
          Eventos más vendidos
        </h1>
      </div>
      <br/>
      <br/>
<c:if test="${clientReports!=null && clientReports.size()>0}">

<c:forEach items="${clientReports}" var="clientReport" varStatus="i">		
		<input id="id_venta${i.index}" value="${clientReport.event_id}" type="hidden"/>
		<input id="nombre_venta_evento${i.index}" value="${clientReport.nombre}" type="hidden"/>
		<input id="num_ventas${i.index}" value="${clientReport.nifs.size()}" type="hidden"/>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<script type="text/javascript">
		var ind=${i.index}; var forma='#id_venta'+ind
		var id_evento=$(forma).val(); forma='#nombre_venta_evento'+ind
		var nombre_evento=$(forma).val(); forma='#num_ventas'+ind
		var ventas=$(forma).val();
		//alert(sale);
		var sale=[id_evento,nombre_evento,ventas]
		sales[i]=sale
		i++;
		</script>
	
</c:forEach>
</c:if>
	<div id="chart">
	<br>
	<br>
	<canvas id="myChart" width="400" height="400" onLoad="drawGraph()"></canvas>
	</div>
	<br>
	<br>
	  <input type="submit" class="btn" id="btnCancel" onclick="<%session.setAttribute("admin", "admin");%>window.location='admin.html';" value="Volver"/>
	  <a type="submit" class="btn" href="javascript:void(0)" onclick="drawGraph2()">Grafico Ventas</a>
	  
  </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script type="text/javascript">
//	document.getElementById("chart").style.display = "none";
	var contains = function(needle) {
	    // Per spec, the way to identify NaN is that it is not equal to itself
	    var findNaN = needle !== needle;
	    var indexOf;

	    if(!findNaN && typeof Array.prototype.indexOf === 'function') {
	        indexOf = Array.prototype.indexOf;
	    } else {
	        indexOf = function(needle) {
	            var i = -1, index = -1;

	            for(i = 0; i < this.length; i++) {
	                var item = this[i];

	                if((findNaN && item !== item) || item === needle) {
	                    index = i;
	                    break;
	                }
	            }

	            return index;
	        };
	    }

	    return indexOf.call(this, needle) > -1;
	};
	
	function drawGraph2(){
		var event_ids=[]; var event_names=[]; var ventas=[]; var n=0;
		alert(i)
		
		for (var a=0;a<i; a++){
			//more than 5 sales
			//alert(sales[a])
			if(sales[a][2]>5){
			
			//if(!contains.call(event_ids,sales[a][0])){
				event_ids[a]=sales[a][0];
				event_names[a]=sales[a][1];
				ventas[a]=sales[a][2];
				n++;
				//alert('added')
				}
		}
		
		var data = {
				 
			    labels: event_names,
			    datasets: [
			        {
			            label: "Quickentrada ventas",
			            fillColor: "rgba(151,187,205,0.2)",
			            strokeColor: "rgba(151,187,205,1)",
			            pointColor: "rgba(151,187,205,1)",
			            pointStrokeColor: "#fff",
			            pointHighlightFill: "#fff",
			            pointHighlightStroke: "rgba(151,187,205,1)",
			            data: ventas
			        }
			        
			    ]
			};
		var options={};
		//Get context with jQuery - using jQuery's .get() method.
		document.getElementById("chart").style.display="inline";
		var ctx = $("#myChart").get(0).getContext("2d");
		//This will get the first returned node in the jQuery collection.
		var myLineChart = new Chart(ctx).Bar(data, options);
	}
		//	drawGraph();
	</script>
    <script src="assets/js/bootstrap.js"></script>
  </body>
</html>