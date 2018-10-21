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
    	<%@ page import="java.sql.Timestamp"%>
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
           			<input type="hidden" name="Time" value="<%=time%>"/>
           			<footer><%=time%></footer>
           			<% } %>
	           		<form action="CriaNota">
	           			<div class="container">
	           				<div style="display: inline-block">
	           					<input type="hidden" name="IdCategoria" value="<%=IdCategoria %>"/>
	           					
		           				<input type="text" name="conteudoNota">
		           				<a href="home.jsp"><button type="submit">Confirmar Nota</button></a>
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