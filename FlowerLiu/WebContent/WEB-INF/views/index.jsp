<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>TecWeb- Projeto 1</title>
        <spring:url value="/resources/settings.css" var="mainCss" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<spring:url value="/resources/settings.js" var="mainJs" />
	
		<link href="${mainCss}" rel="stylesheet" />
  		<script src="${mainJs}"></script>
    </head>
    <body>
        <div class="init">
        <nav class="navbar">Teeppo</nav> 
        <nav class="navbar board">Board</nav>   
        <div class="listas">
            <a href="home">Clique aqui para acessar seu Teepo</a>
        </div>
    	</div>
    </body>
</html>