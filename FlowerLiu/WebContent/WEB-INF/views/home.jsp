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
        		<form action = "criaCategoria" method="post">
        			<h3>Titulo da Categoria: <input type='text' name='tituloCategoria'></h3>
                	<a href="home"><button>Criar Categoria</button></a>
                </form>
                <form action="ProcuraNota" method="post">
	                <input type="text" name="BuscaNota" placeholder="Search..">
					<a href="home"><button>Pesquisar</button></a>
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
           				System.out.println(categ.getIdCategoria());
           				String IdCategoria = categ.getIdCategoria().toString();
           				link = "editaCategoria?categ_id=";
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
	           					<form action="deletaNota" method="post">
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
           				<form action = "criaNota" method="post">
				           	<input type="hidden" name="IdCategoria" value="<%=IdCategoria%>">
                			<a href="criaNota"><button type="submit">Criar Nota</button></a>
                		</form>
           				
           			</div>
           		</div>
           		
           		<br>
           		<div class="container">
           			<div style="display: inline-block">
	           				<input type="hidden" id="IdCategoria" name="IdCategoria" value="<%=IdCategoria %>"/>
	           				<a href="home"><button onclick="deletaCategoria()">Deletar Categoria</button></a>
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
    <script type="text/javascript">
    function deletaCategoria() {
		let idCategoria = document.getElementById("IdCategoria").value
		data = {
			'idCategoria': idCategoria
		}
		
		fetch('/FlowerLiu/home', {
			method: 'DELETE',
			body: JSON.stringify(data)
		})
	}
    </script>
</html>