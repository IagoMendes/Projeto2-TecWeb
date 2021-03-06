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
        <div class="init">
        <nav class="navbar">Teeppo</nav> 
        <nav class="navbar board">Board</nav>   
        <div class="listas">
        	<div class="lista">
                <a href="home"><button>Criar Categoria</button></a>
            </div>
           <!-- AQUI TEM QUE TER O RETURN DAS CATEGORIAS COM TABELAS-->
           <%
           			CategoriasDAO dao = new CategoriasDAO();
					NotasDAO ndao = new NotasDAO();
           			List<Categoria> categorias = dao.getCategorias();
           			String link;
           			
           			if (categorias != null){
           				           			
           			for (Categoria categ: categorias){
           				String IdCategoria = categ.getIdCategoria().toString();
           				List<Nota> notas = ndao.notasCategoria(categ);
           				link = "editCateg.jsp?categ_id=";
           				link += categ.getIdCategoria();
           			
           %>
           <div class="lista">
           		<header><%=categ.getTitulo()%></header>
           			<% 
           				for (Nota nota: notas){
	       					String IdNota = nota.getIdNota().toString();
	   						
           			%>
           			<ul>
           				<li>
           					<%=nota.getConteudo() %>
           					<br>
           					<div style="display: inline-block">
			           			<div style="display: inline-block">
           							<a href="editaNota.jsp"><button>Editar Nota</button></a>
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
           				
           			<% } %>
           			</ul>
           		<footer>Adicionar Nota...</footer>
           		<br>
           		<div style="display: inline-block">
	           		<form action="RemoveCategoria2">
	           			<input type="hidden" name="IdCategoria" value="<%=IdCategoria %>"/>
	           			<button type="submit">Deletar Categoria</button>
	           		</form>
	           	</div>
	           	<br>
	           	<div style="display: inline-block">
	           			<input type="hidden" name="IdCategoria" value="<%=IdCategoria %>"/>
	           			<input type="text" name="TituloCategoria">
	           			<button onclick="editaCategoria()">Confirmar</button>
	           	</div>
           </div>
           <% }
           			}%>
        </div>
    	</div>
    </body>
    <script>
    function editaCategoria() {
		let idCategoria = document.getElementById("IdCategoria").value
		let tituloCategoria = document.getElementById("tituloCategoria").value
		data = {
			'idCategoria': idCategoria,
			'tituloCategoria': tituloCategoria
		}
		
		fetch('/FlowerLiu/categoria', {
			method: 'PUT',
			body: JSON.stringify(data)
		})
	}
    </script>
</html>