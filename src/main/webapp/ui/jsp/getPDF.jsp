<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Image"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!-- page enconding ISO-8859-1 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="es.fi.upm.gallego.model.Evento"%>
<%@page import="es.fi.upm.gallego.model.Cliente"%>
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

<%
 Cliente cliente=(Cliente)session.getAttribute("cliente");
   Evento evento=(Evento)session.getAttribute("evento");
   response.setContentType("application/pdf");
   Document document = new Document();
   PdfWriter.getInstance(document, response.getOutputStream());
   document.open();
   PdfPTable table = new PdfPTable(2);
   table.setWidthPercentage(100);
   table.setWidths(new int[]{1, 2});
   Image img = Image.getInstance(evento.getImg());
   img.scaleAbsolute(200, 200);
   table.addCell(img);
   String text= " Evento: "+evento.getNombre()+" \n Fecha: "+evento.getFecha()+" \n Localidad: "+evento.getLocalidad()+" \n Precio de la entrada: "+evento.getPrecio();
   Font t1= new Font(Font.FontFamily.COURIER, 20,Font.ITALIC | Font.BOLD); 
   table.addCell(new Phrase(text,t1));
   document.addTitle("Gracias por confiar en Quikentrada "+cliente.getNombre());
  Image img_logo=Image.getInstance("http://i63.tinypic.com/2lxjloj.png");
  img_logo.scaleAbsoluteWidth(500);
  document.add(img_logo);
  document.add(table);
   document.close();
   response.flushBuffer();
    %>
    <script src="assets/js/bootstrap.js">
    </script>
  </body>
</html>