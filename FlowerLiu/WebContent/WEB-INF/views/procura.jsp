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
	<%@ page import="java.util.*,mvc.model.*,mvc.controller.*"%>
	<%@ page import="javax.servlet.http.HttpServlet"%>
	<%@ page import="javax.servlet.http.HttpServletRequest"%>
	<div class="init">
    <nav class="navbar">Teeppo</nav> 
    <nav class="navbar board">Board</nav>
    <div class="listas">
    	<a href="home"><button>Home</button></a>
			<%
				CategoriasDAO dao = new CategoriasDAO();
				NotasDAO ndao = new NotasDAO();
				CategoriaController cat = new CategoriaController();
				List<Categoria> categorias = dao.getCategorias();
				String busca = request.getParameter("BuscaNota");
				List<Nota> notasProcura = ndao.procuraNota(busca);
				
				System.out.println("Buscou no link");
				
				for(Nota notaa: notasProcura){	
					System.out.println(notaa.getConteudo());
					System.out.println("N�o rodou ainda o getCategoriaFromID");
					System.out.println(notaa.getIdCategoria());
					Categoria catego = dao.getCategoriaFromId(notaa.getIdCategoria());
					System.out.println("Rodou o getCategoriaFromID");
					for (Categoria categ: categorias){
						List<Nota> notas = ndao.notasCategoria(categ);
						String IdCategoria = categ.getIdCategoria().toString();
						System.out.println("Uma categoria entre todas");
						System.out.println(catego.getTitulo());
						System.out.println(categ.getTitulo());
						if (categ.getIdCategoria() == catego.getIdCategoria()){
							System.out.println("Achou as iguais");
							
						
						
			%>
		<div class="lista">
			<header><%=catego.getTitulo() %></header>
			<%		for (Nota nota: notas){
						if(notaa.getIdNota()==nota.getIdNota()){%>
			<ul>
				<li><%=nota.getConteudo() %>
			</ul>
			<footer><%=nota.getDataUpdate() %></footer>
			<% } }%>
        </div>
           <% } } }%>
		</div>
    </div>
</body>
</html>