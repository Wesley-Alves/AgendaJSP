<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.Date" %>
<%@ page import="br.senai.sp.modelo.Compromisso" %>
<%@ page import="br.senai.sp.modelo.Usuario" %>
<%@ page import="br.senai.sp.util.FormatarData" %>
<%
  if (session.getAttribute("usuario") == null) {
	  response.sendRedirect("login.jsp");
  } else {
	  Usuario usuario = (Usuario) session.getAttribute("usuario");
	  Compromisso compromisso = (Compromisso) request.getAttribute("compromisso");
%>
		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>Editar Compromisso</title>
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
							    <img src="imagens/deletarcompromisso32.png" alt="Excluir" style="margin-right:10px;width:32px;height:32px;">Excluir Compromisso
							  </div>
							  <div class="panel-body">
							  	<div class="alert alert-warning">
							  		<img src="imagens/question24.png" alt="Pergunta" style="margin-right:10px;">Confirma a exclusão do compromisso abaixo ?
							  	</div>
							  	<h3>Detalhes do compromisso:</h3>
							    <p><b>Assunto:</b> <%= compromisso.getAssunto() %></p>
							  	<p><b>Data de Início:</b> <%= FormatarData.formatar(compromisso.getDtInicio()) %></p>
							  	<p><b>Horário de Início:</b> <%= compromisso.getHrInicio() %></p>
							  	<p><b>Local:</b> <%= compromisso.getLocal() %></p>
							  	<hr>
							  	<a href="ExcluirCompromissoServlet?id=<%= compromisso.getId() %>" class="btn btn-danger">Confirmar exclusão</a>
							  	<a href="compromissos.jsp" class="btn btn-info">Cancelar e voltar</a>
							  </div>
							</div>
						</div>
					</div>
					<%@ include file="rodape.html" %>
				</div>
			</body>
		</html>
<%}%>