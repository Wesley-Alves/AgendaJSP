<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.Date" %>
<%@ page import="br.senai.sp.modelo.Usuario" %>
<%@ page import="br.senai.sp.util.FormatarData" %>
<%
  if (session.getAttribute("usuario") == null) {
	  response.sendRedirect("login.jsp");
  } else {
	  Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>Meus Dados</title>
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
							    <img src="imagens/users32.png" alt="Meus Dados" style="margin-right:10px;width:32px;height:32px;">Meus Dados
							  </div>
							  <div class="panel-body">
							  	<form action="AtualizarUsuarioServlet" method="POST">
							  		<strong>Atenção:</strong> nesta tela você poderá atualizar os seus dados e trocar a sua senha.
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtNome">Nome:</label>
									      <input type="text" class="form-control" name="txtNome" placeholder="Digite seu nome..." value="<%= usuario.getNome() %>" required>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtEmail">E-mail:</label>
									      <input type="email" class="form-control" name="txtEmail" placeholder="Digite seu email..." value="<%= usuario.getEmail() %>" required>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-6">
									      <label for="txtSenha">Senha:</label>
									      <input type="password" class="form-control" name="txtSenha" placeholder="Digite sua senha... (inalterado)">
									    </div>
									    <div class="form-group col-md-6">
									      <label for="txtCidade">Cidade:</label>
									      <input type="text" class="form-control" name="txtCidade" placeholder="Digite sua cidade..." value="<%= usuario.getCidade() %>">
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-4">
									      <label for="txtSexo">Sexo:</label><br>
													<input type="radio" name="txtSexo" value="M" style="margin-left:10px;" <%= (usuario.getSexo().equals("M")) ? "checked" : "" %>><span style="margin-left:4px;">Masculino</span>
													<input type="radio" name="txtSexo" value="F" style="margin-left:10px;" <%= (usuario.getSexo().equals("F")) ? "checked" : "" %>><span style="margin-left:4px;">Feminino</span>
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtDtNascimento">Data de Nascimento:</label>
									      <input type="text" class="form-control" name="txtDtNascimento" placeholder="Digite sua data de nascimento..." value="<%= FormatarData.formatar(usuario.getDtNascimento()) %>" required>
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtTelefone">Telefone:</label>
									      <input type="text" class="form-control" name="txtTelefone" placeholder="Digite seu telefone..." value="<%= usuario.getTelefone() %>">
									    </div>
									  </div>
									  <hr style="margin-top: 0px;">
									  <button type="submit" class="btn btn-success">Salvar dados</button>
							  		<a href="index.jsp" class="btn btn-info">Cancelar e voltar</a>
									</form>
							  </div>
							</div>
						</div>
					</div>
					<%@ include file="rodape.html" %>
				</div>
			</body>
		</html>
<%}%>