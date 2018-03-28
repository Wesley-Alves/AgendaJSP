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
				<title>Cadastrar Contato</title>
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
							    <img src="imagens/novocontato48.png" alt="Novo Contato" style="margin-right:10px;width:32px;height:32px;">Novo Contato
							  </div>
							  <div class="panel-body">
							  	<form action="GravarContatoServlet" method="POST">
							  		<input type="hidden" name="txtIdUsuario" value="<%= usuario.getId() %>">
									  <strong style="font-size:16px;">Dados Pessoais:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-6">
									      <label for="txtNome">Nome:</label>
									      <input type="text" class="form-control" name="txtNome" placeholder="Digite o nome..." required>
									    </div>
									    <div class="form-group col-md-6">
									      <label for="txtEmail">E-mail:</label>
									      <input type="email" class="form-control" name="txtEmail" placeholder="Digite o email...">
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-4">
									      <label for="txtTelefone">Telefone:</label>
									      <input type="text" class="form-control" name="txtTelefone" placeholder="Digite o telefone...">
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtCelular">Celular:</label>
									      <input type="text" class="form-control" name="txtCelular" placeholder="Digite o celular...">
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtDtNascimento">Data de Nascimento:</label>
									      <input type="text" class="form-control" name="txtDtNascimento" placeholder="Digite a data de nascimento...">
									    </div>
									  </div>
									  <strong style="font-size:16px;">Endereço:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-8">
									      <label for="txtLogradouro">Logradouro:</label>
									      <input type="text" class="form-control" name="txtLogradouro" placeholder="Digite rua, avenida, travessa...">
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtBairro">Bairro:</label>
									      <input type="text" class="form-control" name="txtBairro" placeholder="Digite o bairro...">
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-5">
									      <label for="txtCidade">Cidade:</label>
									      <input type="text" class="form-control" name="txtCidade" placeholder="Digite a cidade...">
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtEstado">Estado:</label>
									      <select name="txtEstado" class="form-control">
													<option value="SP">São Paulo</option>
													<option value="RJ">Rio de Janeiro</option>
													<option value="PE">Pernambuco</option>
													<option value="GO">Goiás</option>
													<option value="RS">Rio Grande do Sul</option>
									      </select>
									    </div>
									    <div class="form-group col-md-3">
									      <label for="txtCep">Cep:</label>
									      <input type="text" class="form-control" name="txtCep" placeholder="Digite o cep...">
									    </div>
									  </div>
									  <strong style="font-size:16px;">Informações Adicionais:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-3">
									      <label for="txtPessoa">Tipo de pessoa:</label><br>
  											<input type="radio" name="txtPessoa" value="F" checked style="margin-left:10px;"><span style="margin-left:4px;">Física</span>
  											<input type="radio" name="txtPessoa" value="J" style="margin-left:10px;"><span style="margin-left:4px;">Jurídica</span>
									    </div>
									    <div class="form-group col-md-9">
									      <label for="txtContato">Contato:</label>
									      <input type="text" class="form-control" name="txtContato" placeholder="Informe o contato na empresa...">
									    </div>
									  </div>
									  <hr style="margin-top: 0px;">
									  <button type="submit" class="btn btn-success">Cadastrar</button>
									  <button type="reset" class="btn btn-warning">Limpar campos</button>
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