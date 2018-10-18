<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Teepo</title>
<link rel="stylesheet" type="text/css" href="/WEB-INF/css/settings.css">
</head>
<body>
<div class="init">
	<%@ page import="java.util.*,mvc.model.*,mvc.controller.*"%>
    <nav class="navbar">Teeppo</nav> 
    <nav class="navbar board">Board</nav>   
    	<div class="listas">
        	<div class="lista">
                <a href="formTarefa.jsp"><button>Criar Categoria</button></a>
                <c:if test="">
                </c:if>
            </div>
        </div>
</div>
</body>
</html>