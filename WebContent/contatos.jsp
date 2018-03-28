<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="br.senai.sp.modelo.Contato" %>
<%@ page import="br.senai.sp.modelo.Usuario" %>
<%@ page import="br.senai.sp.dao.ContatoDAO" %>
<%@ page import="br.senai.sp.util.FormatarData" %>
<%
  if (session.getAttribute("usuario") == null) {
	  response.sendRedirect("login.jsp");
  } else {
	  Usuario usuario = (Usuario) session.getAttribute("usuario");
		ContatoDAO contatoDao = new ContatoDAO();
		ArrayList<Contato> contatos = contatoDao.pegarContatos(usuario.getId());
%>
		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>Contatos</title>
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
							    <img src="imagens/lista48.png" alt="Lista de Contatos" style="margin-right:10px;width:32px;height:32px;">Meus Contatos
							  </div>
							  <div class="panel-body">
							  	<a href="cadastrar_contato.jsp" class="btn btn-primary" style="margin-bottom: 10px;">Novo Contato</a>
							    <table class="table table-hover">
								  	<thead>
									  	<tr>
									      <th>Nome</th>
									      <th>E-mail</th>
									      <th>Telefone</th>
									      <th>Celular</th>
									      <th></th>
									    </tr>
								    </thead>
								    <tbody>
								      <% for (Contato contato : contatos) { %>
									    	<tr>
									        <td><a href="ListarContatoServlet?id=<%= contato.getId() %>&tela=consulta"><%= contato.getNome() %></a></td>
									        <td><%= contato.getEmail() %></td>
									        <td><%= contato.getTelefone() %></td>
									        <td><%= contato.getCelular() %></td>
									        <td>
									        	<a href="ListarContatoServlet?id=<%= contato.getId() %>&tela=editar"><img src="imagens/edit20.png" alt="Editar"></a> | 
									        	<a href="ListarContatoServlet?id=<%= contato.getId() %>&tela=excluir"><img src="imagens/delete20.png" alt="Excluir"></a>
									        </td>
									      </tr>
									    <% } %>
								    </tbody>
								  </table>
							  	<a href="cadastrar_contato.jsp" class="btn btn-primary">Novo Contato</a>
							  </div>
							</div>
						</div>
					</div>
					<%@ include file="rodape.html" %>
				</div>
			</body>
		</html>
<%}%>