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
    	<%@ page import="java.sql.Timestamp"%>
        <div class="init">
        <nav class="navbar">Teeppo</nav> 
        <nav class="navbar board">Board</nav>   
        <div class="listas">
        	<div class="lista">
                <a href="criaCategoria">><button>Criar Categoria</button></a>
            </div>
           <!-- AQUI TEM QUE TER O RETURN DAS CATEGORIAS COM TABELAS-->
           <%		
           			CategoriasDAO dao = new CategoriasDAO();
					NotasDAO ndao = new NotasDAO();
           			List<Categoria> categorias = dao.getCategorias();
           			
           			String link, linkNota;
           			
           			if (categorias != null){
           				           			
	           			for (Categoria categ: categorias){
	           				List<Nota> notas = ndao.notasCategoria(categ);
	           				String IdCategoria = categ.getIdCategoria().toString();
	           				link = "editaCategoria.jsp?categ_id=";
	           				link += categ.getIdCategoria();
	           				
           			
           %>
           <div class="lista">
           		<header><%=categ.getTitulo()%></header>
           			<% 
           				Timestamp time;
	           			for (Nota nota: notas){
	           				
	       					String IdNota = nota.getIdNota().toString();	
	       					time = nota.getDataCriacao();
	   						
           			%>
           			<ul>
           				<li>
           					<%=nota.getConteudo() %>
           					<br>
           					<div style="display: inline-block">
			           			<div style="display: inline-block">
           							<a href="editaNota"><button>Editar Nota</button></a>
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
           			<input type="hidden" name="Time" value="<%=time%>"/>
           			<footer><%=time%></footer>
           			<% } %>
	           		<form action="criaNota" method="post">
	           			<div class="container">
	           				<div style="display: inline-block">
	           					<input type="hidden" name="IdCategoria" value="<%=IdCategoria %>"/>
		           				<input type="text" name="conteudoNota">
		           				<a href="home"><button type="submit">Confirmar Nota</button></a>
	           				</div>
           				</div>
           			</form>
           			
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
           	  	}
           	%>
        </div>
    	</div>
    </body>
</html>