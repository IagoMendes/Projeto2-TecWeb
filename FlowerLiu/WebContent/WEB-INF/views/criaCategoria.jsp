<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>TecWeb- Projeto 1</title>
    <link rel="stylesheet" type="text/css" href="settings.css">
</head>
<body>
	<%@ page import="java.util.*,mvc.model.*,mvc.controller.*"%>
    <div class="init">
    <nav class="navbar board">Teepo</nav> 
    <nav class="navbar">Board</nav>
    <div class="listas">
    	<%String link = "home.jsp"; %>
    	<div class="cria-categoria">
	    	<form:form method="POST action="/FlowerLiu/criaCategoria">
		   		<h3>Titulo da Categoria: <input type='text' name='tituloCategoria'></h3>
		   		<a href=<%=link %>><button type="submit">Criar Categoria</button></a>
		   	</form>
    	</div>
        
        <%
           			DAO dao = new DAO();
           			List<Categorias> categorias = dao.getCategorias();
           			           			
           			if (categorias != null){
           				           			
           			for (Categorias categ: categorias){
           				List<Notas> notas = dao.notasCategoria(categ);
           				String IdCategoria = categ.getIdCategoria().toString();
           				           			
           %>
           <div class="lista">
           		<header><%=categ.getTitulo()%></header>
           			<ul>
           			<% 
           				
	           			for (Notas nota: notas){
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