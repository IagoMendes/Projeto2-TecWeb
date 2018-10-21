<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>TecWeb- Projeto 1</title>
<link rel="stylesheet" type="text/css" href="settings.css">
</head>
<body>
	<%@ page import="java.util.*,mvc.model.*,mvc.controller.*"%>
	<%@ page import="javax.servlet.http.HttpServlet"%>
	<%@ page import="javax.servlet.http.HttpServletRequest"%>
   	<% String linkCategoria = "criaCategoria.jsp";%>
	<div class="init">
    <nav class="navbar">Teeppo</nav> 
    <nav class="navbar board">Board</nav>
    <div class="listas">
    	<a href="home.jsp"><button>Home</button></a>
			<%
				DAO dao = new DAO();
			
				List<Categorias> categorias = dao.getCategorias();
				String busca = request.getParameter("BuscaNota");
				List<Notas> notasProcura = dao.procuraNota(busca);
				
				System.out.println("Buscou no link");
				
				for(Notas notaa: notasProcura){	
					System.out.println(notaa.getConteudo());
					System.out.println("Não rodou ainda o getCategoriaFromID");
					System.out.println(notaa.getIdCategoria());
					Categorias catego = dao.getCategoriaFromId(notaa.getIdCategoria());
					System.out.println("Rodou o getCategoriaFromID");
					for (Categorias categ: categorias){
						List<Notas> notas = dao.notasCategoria(categ);
						String IdCategoria = categ.getIdCategoria().toString();
						System.out.println("Uma categoria entre todas");
						System.out.println(catego.getTitulo());
						System.out.println(categ.getTitulo());
						if (categ.getIdCategoria() == catego.getIdCategoria()){
							System.out.println("Achou as iguais");
							
						
						
			%>
		<div class="lista">
			<header><%=catego.getTitulo() %></header>
			<%		for (Notas nota: notas){
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