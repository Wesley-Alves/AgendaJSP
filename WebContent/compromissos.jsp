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
		ArrayList<Compromisso> compromissos = compromissoDao.pegarCompromissos(usuario.getId());
%>
		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>Compromissos</title>
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
							    <img src="imagens/calendario48.png" alt="Calendário" style="margin-right:10px;width:32px;height:32px;">Meus Compromissos
							  </div>
							  <div class="panel-body">
							  	<a href="cadastrar_compromisso.jsp" class="btn btn-primary" style="margin-bottom: 10px;">Novo Compromisso</a>
							    <table class="table table-hover">
								  	<thead>
									  	<tr>
									      <th>Assunto</th>
									      <th>Data</th>
									      <th>Horário</th>
									      <th>Local</th>
									      <th></th>
									    </tr>
								    </thead>
								    <tbody>
								      <% for (Compromisso compromisso : compromissos) { %>
									    	<tr>
									        <td><a href="ListarCompromissoServlet?id=<%= compromisso.getId() %>&tela=consulta"><%= compromisso.getAssunto() %></a></td>
									        <td><%= FormatarData.formatar(compromisso.getDtInicio()) %></td>
									        <td><%= compromisso.getHrInicio() %></td>
									        <td><%= compromisso.getLocal() %></td>
									        <td>
									        	<a href="ListarCompromissoServlet?id=<%= compromisso.getId() %>&tela=editar"><img src="imagens/edit20.png" alt="Editar"></a> | 
									        	<a href="ListarCompromissoServlet?id=<%= compromisso.getId() %>&tela=excluir"><img src="imagens/delete20.png" alt="Excluir"></a>
									        </td>
									      </tr>
									    <% } %>
								    </tbody>
								  </table>
							  	<a href="cadastrar_compromisso.jsp" class="btn btn-primary">Novo Compromisso</a>
							  </div>
							</div>
						</div>
					</div>
					<%@ include file="rodape.html" %>
				</div>
			</body>
		</html>
<%}%>