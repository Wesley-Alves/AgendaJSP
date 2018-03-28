<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="br.senai.sp.modelo.Compromisso"%>
<%@ page import="br.senai.sp.modelo.Usuario" %>
<%@ page import="br.senai.sp.dao.CompromissoDAO" %>
<%@ page import="br.senai.sp.util.FormatarData" %>
<%
  if (session.getAttribute("usuario") == null) {
	  response.sendRedirect("login.jsp");
  } else {
	  Usuario usuario = (Usuario) session.getAttribute("usuario");
	  CompromissoDAO compromissoDao = new CompromissoDAO();
		ArrayList<Compromisso> compromissos = compromissoDao.pegarProximosCompromissos(usuario.getId());
%>
		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>Início</title>
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
							    <img src="imagens/relogio48.png" alt="Relógio" style="margin-right:10px;width:32px;height:32px;">Minha Agenda
							  </div>
							  <div class="panel-body">
							  	<% if (compromissos.isEmpty()) { %>
							  		<p style="text-align:center;">Você não tem nenhum compromisso próximo. Você pode cadastrar novos compromissos na página <strong>Compromissos</strong>.</p>
							  	<% } else { %>
							  		<% for (Compromisso compromisso : compromissos) { %>
									  	<div class="col-md-4">
									  		<div class="panel panel-info">
												  <div class="panel-heading">
												    <%= compromisso.getAssunto() %>
												  </div>
												  <div class="panel-body">
												  	<p><b>Data:</b> <%= FormatarData.formatar(compromisso.getDtInicio()) %></p>
												  	<p><b>Horário:</b> <%= compromisso.getHrInicio() %></p>
												  	<p><b>Local:</b> <%= compromisso.getLocal() %></p>
												  </div>
												  <div class="panel-footer" style="text-align:right;">
												    <a href="ListarCompromissoServlet?id=<%= compromisso.getId() %>&tela=consulta">Ver detalhes</a>
												  </div>
												</div>
									  	</div>
									  <% } %>
							  	<% } %>
							  </div>
							</div>
						</div>
					</div>
					<%@ include file="rodape.html" %>
				</div>
			</body>
		</html>
<%}%>