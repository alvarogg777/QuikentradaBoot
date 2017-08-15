	<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
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
    

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<!-- 

	<script type="text/javascript" src="jquery-1.8.3.js"></script>
	<script type="text/javascript">
		$(document).ready(
			function() {
				$.getJSON('<spring:url value="activities.json"/>', {
					ajax : 'true'
				}, function(data){
					var html = '<option value="">--Please select one--</option>';
					var len = data.length;
					for (var i = 0; i < len; i++) {
						html += '<option value="' + data[i].desc + '">'
								+ data[i].desc + '</option>';
					}
					html += '</option>';
					
					$('#activities').html(html);
				});
				
			});
		
	</script>
	 -->
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
            <spring:message code="eventM.header2"/>
          </a>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div>
        <h1>
          <spring:message code="eventM.header3"/>
        </h1>
      </div>
      <a class="btn" href="?language=en">
        English
      </a>
      <a class="btn" href="?language=es">
        Spanish
      </a>
      <br/>
      <br/>
      <form:form commandName="evento" id="evento">
      	<form:errors path="*" cssClass="errorblock" element="div" />
      	<div class="control-group">
          <label for="textinput1"><spring:message code="eventM.name"/></label>
          	<form:input path="nombre" cssClass="error"/>
          	<form:errors path="nombre" cssClass="error" />
		  <label for="textinput1"><spring:message code="eventM.theme"/></label>
          	<form:input path="tipo" cssClass="error"/>
          	<form:errors path="tipo" cssClass="error" />
		  <label for="textinput1"><spring:message code="eventM.date"/></label>          
          	<form:input path="fecha" cssClass="error" placeholder="DD/MM/YYYY" pattern="\d{2}/\d{2}\d{4}" title="expression must match the format DD/MM/YYYY"/>
          	<form:errors path="fecha" cssClass="error" />
          <label for="textinput1"><spring:message code="eventM.price"/></label>
          	<form:input path="precio" cssClass="error"/>
          	<form:errors path="precio" cssClass="error" />
		  <label for="textinput1"><spring:message code="eventM.location"/></label>
          	<form:input path="localidad" cssClass="error"/>
          	<form:errors path="localidad" cssClass="error" />
          <label for="textinput1"><spring:message code="eventM.tickets"/></label>
          	<form:input path="disponibilidad" cssClass="error" title="avaliability must be greater than 0" pattern="\d+"/>
          	<form:errors path="disponibilidad" cssClass="error" />
          <label for="textinput1"><spring:message code="eventM.img"/></label>
          	<form:input path="img" cssClass="error"/>
          	<form:errors path="img" cssClass="error" />
        </div>
     		      <a type="submit" class="btn" href="javascript:void(0)" onclick="document.getElementById('evento').submit()"><spring:message code="eventM.button.add"/></a>
     	
	</form:form>
      <a type="submit" class="btn" href="javascript:void(0)" onclick="<%session.setAttribute("admin", "admin");%>window.location='admin.html';"><spring:message code="eventM.button.cancel"/></a>
      	
    </div>

    <script src="assets/js/bootstrap.js">
    </script>
  </body>
</html>