<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tarefa</title>
</head>
<body>

	<h3>Adicionar Tarefa</h3>
	<form action="adicionaTarefa" method="post">
		Descrição: <br/>
		<textarea name="descricao" rows="6" cols="80"></textarea><br>
		<input type="submit" value="Adicionar">
	</form>

</body>
</html>