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
        <div class="init">
        <nav class="navbar">Teeppo</nav> 
        <nav class="navbar board">Board</nav>   
        <div class="listas">
        	<div class="lista">
                <a href="criaCategoria">><button>Criar Categoria</button></a>
                <form action="ProcuraNota">
	                <input type="text" name="BuscaNota" placeholder="Search..">
					<a href="procura.jsp"><button>Pesquisar</button></a>
				</form>
            </div>
           <%
           			CategoriasDAO dao = new CategoriasDAO();
					NotasDAO ndao = new NotasDAO();
  					List<Categoria> categorias = dao.getCategorias();
           			String link,linkNota;
           			
           			if (categorias != null){
           				           			
           			for (Categoria categ: categorias){
           				List<Nota> notas = ndao.notasCategoria(categ);
           				String IdCategoria = categ.getIdCategoria().toString();
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
           							<a href="editaNota"><button>Editar Nota</button></a>
        						</div>
           					</div>
           					<div style="display: inline-block">
	           					<form action="RemoveNota">
				           			<input type="hidden" name="IdNota" value="<%=IdNota%>">
				           			<input type="hidden" name="IdCategoria" value="<%=IdCategoria%>">
				           			<a href="deletaNota"><button type="submit">Excluir Nota</button></a>
				           		</form>
				           	</div>
           				</li>
           			</ul>
           		<footer><%=nota.getDataUpdate() %></footer>
           		<% } %>
           		<br>
           		<div class="container">
           			<div style="display: inline-block">
           				<a href="criaNota"><button type="submit">Criar Nota</button></a>
           			</div>
           		</div>
           		
           		<br>
           		<div class="container">
           			<div style="display: inline-block">
	           			<form action="RemoveCategoria2">
	           				<input type="hidden" name="IdCategoria" value="<%=IdCategoria %>"/>
	           				<a href="deletaCategoria"><button type="submit">Deletar Categoria</button></a>
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