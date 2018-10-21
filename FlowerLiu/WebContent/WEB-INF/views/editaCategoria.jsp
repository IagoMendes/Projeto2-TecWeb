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
           			DAO dao = new DAO();
           			List<Categorias> categorias = dao.getCategorias();
           			String link;
           			
           			if (categorias != null){
           				           			
           			for (Categorias categ: categorias){
           				String IdCategoria = categ.getIdCategoria().toString();
           				List<Notas> notas = dao.notasCategoria(categ);
           				link = "editCateg.jsp?categ_id=";
           				link += categ.getIdCategoria();
           			
           %>
           <div class="lista">
           		<header><%=categ.getTitulo()%></header>
           			<% 
           				for (Notas nota: notas){
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
	           		<form action="EditaCategoria">
	           			<input type="hidden" name="IdCategoria" value="<%=IdCategoria %>"/>
	           			<input type="text" name="TituloCategoria">
	           			<button>Confirmar</button>
	           		</form>
	           	</div>
           </div>
           <% }
           			}%>
        </div>
    	</div>
    </body>
</html>