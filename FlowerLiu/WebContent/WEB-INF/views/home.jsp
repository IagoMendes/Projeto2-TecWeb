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
        			<% CategoriaController cat = new CategoriaController();
           			Integer temp = cat.apiTempo();%>
        			<h4>Titulo da Categoria: <input type='text' id="tituloCategoria" name='tituloCategoria'></h4	>
                	<a><button onclick="criaCategoria()">Criar Categoria</button></a>	
                <form action="procura" method="get">
	                <input type="text" id="conteudoPesquisa" name="conteudoPesquisa" placeholder="Search..">
					<a><button onclick="pesquisa()">Pesquisar</button></a>
					<h5>Temperatura de <%=temp %> ºC em São Paulo</h5>
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
			           				<input type="hidden" id="IdCategoria" name="IdCategoria" value="<%=IdCategoria %>"/>
			           				<input type="hidden" id="IdNota" name="IdNota" value="<%=IdNota%>"/>
           							<input type="text" id="conteudoNota" name="conteudoNota">
           							<button onclick="editaNota()">Editar Nota</button>
        						</div>
           					</div>
           					<div style="display: inline-block">
				           			<input type="hidden" id="IdCategoria" name="IdCategoria" value="<%=IdCategoria %>"/>
			           				<input type="hidden" id="IdNota" name="IdNota" value="<%=IdNota%>"/>
				           			<button onclick="deletaNota()">Excluir Nota</button>
				           	</div>
				           	<div style="display: inline-block">
				           			<input type="hidden" id="conteudoNotaT" value="<%=nota.getConteudo() %>">
				           			<button onclick="postaTweet()">Tweetar</button>
				           	</div>
				           	
           				</li>
           			</ul>
           		<footer><%=nota.getDataUpdate() %></footer>
           		<% } %>
           		<br>
           		<div class="container">
           			<div style="display: inline-block">
				           	<input type="hidden" name="IdCategoria" value="<%=IdCategoria%>">
				           	<input type="text" id="conteudoNota" name="conteudoNota">
                			<button onclick="criaNota()">Criar Nota</button>
           			</div>
           		</div>
           		
           		<br>
           		<div class="container">
           			<div style="display: inline-block">
	           				<input type="hidden" id="IdCategoria" name="IdCategoria" value="<%=IdCategoria %>"/>
	           				<button onclick="deletaCategoria()">Deletar Categoria</button>
           			</div>
           			<div style="display: inline-block">
           				<input type="hidden" id="IdCategoria" name="IdCategoria" value="<%=IdCategoria %>"/>
           				<input type="text" id="editaCategoria" name="editaCategoria" >
           				<button onclick="editaCategoria()">Editar Categoria</button>
        			</div>
        		</div>
           </div>
           <% }
           			}%>
        </div>
    	</div>
    	
    </body>
    <script type="text/javascript">
    function criaNota() {
		let idCategoria = document.getElementById("IdCategoria").value
		let conteudoNota = document.getElementById("conteudoNota").value
		data = {
			'idCategoria': idCategoria,
			'conteudoNota': conteudoNota
		}
		
		fetch('/FlowerLiu/nota', {
			method: 'POST',
			body: JSON.stringify(data)
		})
		document.location.reload()
	}
    function criaCategoria() {
		let tituloCategoria = document.getElementById("tituloCategoria").value
		data = {
			'tituloCategoria': tituloCategoria
		}
		
		fetch('/FlowerLiu/categoria', {
			method: 'POST',
			body: JSON.stringify(data)
		})
		document.location.reload()

	}
    function deletaNota() {
		let idCategoria = document.getElementById("IdCategoria").value
		let idNota = document.getElementById("IdNota").value
		data = {
			'idCategoria': idCategoria,
			'idNota': idNota
		}
		
		fetch('/FlowerLiu/nota', {
			method: 'DELETE',
			body: JSON.stringify(data)
		})
		document.location.reload()
	}
    function deletaCategoria() {
		let idCategoria = document.getElementById("IdCategoria").value
		data = {
			'idCategoria': idCategoria
		}
		
		fetch('/FlowerLiu/categoria', {
			method: 'DELETE',
			body: JSON.stringify(data)
		})
		document.location.reload()

	}
    function editaCategoria() {
		let idCategoria = document.getElementById("IdCategoria").value
		let tituloCategoria = document.getElementById("editaCategoria").value
		console.log(tituloCategoria)
		data = {
			'idCategoria': idCategoria,
			'tituloCategoria': tituloCategoria
		}
		
		fetch('/FlowerLiu/categoria', {
			method: 'PUT',
			body: JSON.stringify(data)
		})
		document.location.reload()
	}
    function editaNota() {
		let idCategoria = document.getElementById("IdCategoria").value
		let idNota = document.getElementById("IdNota").value
		let conteudoNota = document.getElementById("conteudoNota").value
		data = {
			'idCategoria': idCategoria,
			'conteudoNota': conteudoNota,
			'idNota': idNota
		}
		
		fetch('/FlowerLiu/nota', {
			method: 'PUT',
			body: JSON.stringify(data)
		})
		document.location.reload()
	}
    function postaTweet(){
    	let conteudoNota = document.getElementById("conteudoNotaT").value
    	data = {
    		'conteudoNota': conteudoNota
    	}
    	fetch('/FlowerLiu/tweet', {
			method: 'POST',
			body: JSON.stringify(data)
		})
    }
    function pesquisa(){
    	let conteudoPesquisa = document.getElementById("conteudoPesquisa").value
    	data = {
    		'conteudoPesquisa': conteudoPesquisa
    	}
    	fetch('/FlowerLiu/procura', {
    		method: 'GET',
    		body: JSON.stringify(data)
    	})
    }
    </script>
</html>