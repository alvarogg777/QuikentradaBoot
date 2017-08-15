<%@page import="javax.swing.text.html.HTMLDocument"%>
<%@page import="javax.swing.text.html.HTMLFrameHyperlinkEvent"%>
<%@page import="javax.swing.JEditorPane"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!-- page enconding ISO-8859-1 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="es.upm.fi.g1.model.Evento"%>
<%@page import="es.upm.fi.g1.model.Cliente"%>


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
          Por favor, ingrese sus datos bancarios:
          <br>
          &nbsp;
        </p>
      </div>
      
      <form:form modelAttribute="payment" id="payment">
		<form:errors path="*" cssClass="errorblock" element="div" />
			<label for="textinput1">
	          Numero de tarjeta:
	        </label>
			
			<form:input path="bank_card_num" id="bank_num" cssErrorClass="error" title="XXXX-XXXX-XXXX-XXXX" placeholder="XXXX-XXXX-XXXX-XXXX" pattern="\d{4}-\d{4}-\d{4}-\d{4}"/>
			<form:errors path="bank_card_num" cssClass="error" />
			<label for="textinput1">
	          Fecha de caducidad:
	        </label>			
			<form:input path="fecha" cssErrorClass="error" id="fecha" title="MM/YY" placeholder="MM/YY" pattern="\d{2}/\d{2}" />
			<form:errors path="fecha" cssClass="error" />
			<label for="textinput1">
	          CVV:
	        </label>	
			<form:input path="cvv" cssErrorClass="error" title="debe contener 3 digitos" id="cvv" placeholder="XXX" pattern="\d{3}"/>
			<form:errors path="cvv" cssClass="error" />
			
			<br/>
			<input type="submit" class="btn" value="Comprar" disabled/>
	
	  </form:form>
<!-- $("#myForm").bind('ajax:complete', function() {
inicio de java %%

   Cliente cliente=(Cliente)session.getAttribute("cliente");
   String evento=(String)session.getAttribute("evento");
   response.setContentType("application/pdf");
   Document document = new Document();
   PdfWriter.getInstance(document, response.getOutputStream());
   document.open();
   document.addTitle("Document Title");
   document.add(new Paragraph(cliente.getNombre()+evento.toString()));
   //+" , "+evento.getNombre()+" , "+evento.getFecha()+" , "+evento.getLocalidad()+" , "+evento.getPrecio()));

   document.close();
%>


   });
	 -->
	 <div id="cancel">
	  <input type="submit" class="btn" id="Cancelar" onclick="window.location='getEvents.html';" name="Cancelar" value="Cancelar">
	</div>
	<%boolean a=false;
	if(session.getAttribute("pdf")!=null)
	a=true;%>
	<c:if test='<%=a%>'>Su pago ha sido realizado con exito, puede ver <a href='<%=session.getAttribute("pdf")%>'>aqui </a>su entrada!
	<br>
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	 $('#payment').hide();
	 $('p').hide();
	 window.onload = function () {
		    var e = document.getElementById("cancel").style.display="none";
		    //e.innerHTML='Found you';
		};
	 </script>
	 <br>
	 <input type="submit" class="btn" id="btnInicio" onclick="window.location='/Quikentrada';" value="Ir al inicio"/>
	  <br>
	 <br>
	</c:if> 
	 
      <div class="control-group">
      </div>
    </div>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript">
    $('#payment').change(function compareEmail(){
    if(/^\d{3}$/.test($('#cvv').val())&&/^\d{4}-\d{4}-\d{4}-\d{4}$/.test($('#bank_num').val())&&/^\d{2}\/\d{2}$/.test($('#fecha').val()))
			$('input[type="submit"]').prop('disabled',false);

    });
    	
    </script>
    </body>
</html>