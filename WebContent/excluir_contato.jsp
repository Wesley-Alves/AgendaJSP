<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.Date" %>
<%@ page import="br.senai.sp.modelo.Contato" %>
<%@ page import="br.senai.sp.modelo.Usuario" %>
<%@ page import="br.senai.sp.util.FormatarData" %>
<%
  if (session.getAttribute("usuario") == null) {
	  response.sendRedirect("login.jsp");
  } else {
	  Usuario usuario = (Usuario) session.getAttribute("usuario");
		Contato contato = (Contato) request.getAttribute("contato");
%>
		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="ISO-8859-1">
				<title>Excluir Contato</title>
				<link rel="stylesheet" href="css/bootstrap.css">
			</head>
			<body>
				<div class="container" style="box-shadow: 3px 3px 5px gray;border-radius:10px;border:1px dotted;">
					<%@ include file="cabecalho.html" %>
					<div class="row">
						<div class="col-md-3">
							<%@ include file="painel_usuario.jsp" %>
							<%@ include file="painel_menu.html" %>
						</div>
						<div class="col-md-9">
							<div class="panel panel-primary">
							  <div class="panel-heading">
							    <img src="imagens/deletecontato48.png" alt="Excluir Contato" style="margin-right:10px;width:32px;height:32px;">Excluir Contato
							  </div>
							  <div class="panel-body">
							  	<div class="alert alert-warning">
							  		<img src="imagens/question24.png" alt="Pergunta" style="margin-right:10px;">Confirma a exclusão do contato abaixo ?
							  	</div>
							  	<h3>Detalhes do contato:</h3>
							    <p><b>Nome:</b> <%= contato.getNome() %></p>
							  	<p><b>E-mail:</b> <%= contato.getEmail() %></p>
							  	<p><b>Telefone:</b> <%= contato.getTelefone() %></p>
							  	<p><b>Celular:</b> <%= contato.getCelular() %></p>
							  	<p><b>Cidade:</b> <%= contato.getCidade() %></p>
							  	<hr>
							  	<a href="ExcluirContatoServlet?id=<%= contato.getId() %>" class="btn btn-danger">Confirmar exclusão</a>
							  	<a href="contatos.jsp" class="btn btn-info">Cancelar e voltar</a>
							  </div>
							</div>
						</div>
					</div>
					<%@ include file="rodape.html" %>
				</div>
			</body>
		</html>
<%}%>