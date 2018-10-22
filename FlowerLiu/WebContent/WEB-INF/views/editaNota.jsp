<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>TecWeb - Projeto 1</title>
        <spring:url value="/resources/settings.css" var="mainCss" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<spring:url value="/resources/settings.js" var="mainJs" />
	
		<link href="${mainCss}" rel="stylesheet" />
  		<script src="${mainJs}"></script>
    </head>
    <body>
    	<%@ page import="java.util.*,mvc.model.*,mvc.controller.*"%>
    	<% String linkCategoria = "criaCategoria.jsp";%>
        <div class="init">
        <nav class="navbar">Teeppo</nav> 
        <nav class="navbar board">Board</nav>   
        <div class="listas">
        	<div class="lista">
                <a href=<%=linkCategoria%>><button>Criar Categoria</button></a>
            </div>
           <!-- AQUI TEM QUE TER O RETURN DAS CATEGORIAS COM TABELAS-->
           <%
          			CategoriasDAO dao = new CategoriasDAO();
					NotasDAO ndao = new NotasDAO();
           			List<Categoria> categorias = dao.getCategorias();
           			String link,linkNota;
           			
           			if (categorias != null){
           				           			
           			for (Categoria categ: categorias){
           				List<Nota> notas = ndao.notasCategoria(categ);
           				String IdCategoria = categ.getIdCategoria().toString();
           				link = "home.jsp?categ_id=";
           				link += categ.getIdCategoria();
           			
           %>
           <div class="lista">
           		<header><%=categ.getTitulo()%></header>
           			<% 
	           			for (Nota nota: notas){
	       					String IdNota = nota.getIdNota().toString();
	       					link += "?nota_id=" + nota.getIdNota();
           			%>
           			<ul>
           			
           				<li>           					
           					<br>
           					<div style="display: inline-block">
			           			<div style="display: inline-block">
			           				<form action="EditaNota" id="notaForm">
			           					<input type="hidden" name="IdNota" value="<%=IdNota%>">
				           				<input type="hidden" name="IdCategoria" value="<%=IdCategoria%>">
										<textarea name="ConteudoNota" form="notaForm"><%=nota.getConteudo() %></textarea>
										<button>Confirmar</button>
									</form>
        						</div>
           					</div>
           					<div style="display: inline-block">
	           					<form action="RemoveNota">
				           			<input type="hidden" name="IdNota" value="<%=IdNota%>">
				           			<input type="hidden" name="IdCategoria" value="<%=IdCategoria%>">
				           			<button type="submit">Excluir Nota</button>
				           		</form>
				           	</div>
           				</li>
           			</ul>
           		<footer><%=nota.getDataCriacao() %></footer>
           		<% } %>
           		<br>
           		<div class="container">
           			<div style="display: inline-block">
           				<a href="criaNota.jsp"><button type="submit">Criar Nota</button></a>
           			</div>
           		</div>
           		
           		<br>
           		<div class="container">
           			<div style="display: inline-block">
	           			<form action="RemoveCategoria2">
	           				<input type="hidden" name="IdCategoria" value="<%=IdCategoria %>"/>
	           				<button type="submit">Deletar Categoria</button>
	           			</form>
           			</div>
           			<div style="display: inline-block">
           				<a href="editaCategoria.jsp"><button>Editar Categoria</button></a>
        			</div>
        		</div>
           </div>
           <% }
           			}%>
        </div>
    	</div>
    </body>
</html>