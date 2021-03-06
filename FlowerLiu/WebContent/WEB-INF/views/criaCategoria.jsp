<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<%@ page import="java.util.*,mvc.model.*,mvc.controller.*"%>
    <div class="init">
    <nav class="navbar board">Teepo</nav> 
    <nav class="navbar">Board</nav>
    <div class="listas">
    	<div class="cria-categoria">
	        <form method="post" action="criaCategoria">
		   		<h3>Titulo da Categoria: <input type='text' name='tituloCategoria'></h3>
		   		<a href="home"><button type="submit">Criar Categoria</button></a>
		   	</form>
    	</div>
        
        <%
           			CategoriasDAO dao = new CategoriasDAO();
        			NotasDAO ndao = new NotasDAO();
           			List<Categoria> categorias = dao.getCategorias();
           			           			
           			if (categorias != null){
           				           			
           			for (Categoria categ: categorias){
           				List<Nota> notas = ndao.notasCategoria(categ);
           				String IdCategoria = categ.getIdCategoria().toString();
           				           			
           %>
           <div class="lista">
           		<header><%=categ.getTitulo()%></header>
           			<ul>
           			<% 
           				
	           			for (Nota nota: notas){
	       					String IdNota = nota.getIdNota().toString();
	   						
           			%>
           				<li>
           					<%=nota.getConteudo() %>
           					<div style="display: inline-block">
			           			<div style="display: inline-block">
           							<a href="editaNota.jsp"><button>Editar Nota</button></a>
        						</div>
           					</div>
           					<div style="display: inline-block">
	           					<form action="RemoveNota">
				           			<input type="hidden" name="IdNota" value="<%=IdNota%>">
				           			<button type="submit">Excluir Nota</button>
				           		</form>
				           	</div>
           				</li>           				           			
           			</ul>      
           		<% } %>
           		<footer> Teepo </footer>    
        </div>
        
        <% }}%>
    </div>
</div>
</body>
</html>