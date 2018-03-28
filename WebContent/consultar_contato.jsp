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
				<meta charset="UTF-8">
				<title>Consultar Contato</title>
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
							    <img src="imagens/detalhescontato48.png" alt="Detalhes do Contato" style="margin-right:10px;width:32px;height:32px;">Detalhes do Contato
							  </div>
							  <div class="panel-body">
							  	<form>
									  <strong style="font-size:16px;">Dados Pessoais:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-6">
									      <label for="txtNome">Nome:</label>
									      <input type="text" class="form-control" name="txtNome" value="<%= contato.getNome() %>" disabled>
									    </div>
									    <div class="form-group col-md-6">
									      <label for="txtEmail">E-mail:</label>
									      <input type="email" class="form-control" name="txtEmail" value="<%= contato.getEmail() %>" disabled>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-4">
									      <label for="txtTelefone">Telefone:</label>
									      <input type="text" class="form-control" name="txtTelefone" value="<%= contato.getTelefone() %>" disabled>
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtCelular">Celular:</label>
									      <input type="text" class="form-control" name="txtCelular" value="<%= contato.getCelular() %>" disabled>
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtDtNascimento">Data de Nascimento:</label>
									      <input type="text" class="form-control" name="txtDtNascimento"  value="<%= FormatarData.formatar(contato.getDtNascimento()) %>" disabled>
									    </div>
									  </div>
									  <strong style="font-size:16px;">Endereço:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-8">
									      <label for="txtLogradouro">Logradouro:</label>
									      <input type="text" class="form-control" name="txtLogradouro" value="<%= contato.getLogradouro() %>" disabled>
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtBairro">Bairro:</label>
									      <input type="text" class="form-control" name="txtBairro" value="<%= contato.getBairro() %>" disabled>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-5">
									      <label for="txtCidade">Cidade:</label>
									      <input type="text" class="form-control" name="txtCidade" value="<%= contato.getCidade() %>" disabled>
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtEstado">Estado:</label>
									      <select name="txtEstado" class="form-control" disabled>
													<option value="SP" <%= (contato.getEstado().equals("SP")) ? "selected" : "" %>>São Paulo</option>
													<option value="RJ" <%= (contato.getEstado().equals("RJ")) ? "selected" : "" %>>Rio de Janeiro</option>
													<option value="PE" <%= (contato.getEstado().equals("PE")) ? "selected" : "" %>>Pernambuco</option>
													<option value="GO" <%= (contato.getEstado().equals("GO")) ? "selected" : "" %>>Goiás</option>
													<option value="RS" <%= (contato.getEstado().equals("RS")) ? "selected" : "" %>>Rio Grande do Sul</option>
									      </select>
									    </div>
									    <div class="form-group col-md-3">
									      <label for="txtCep">Cep:</label>
									      <input type="text" class="form-control" name="txtCep" value="<%= contato.getCep() %>" disabled>
									    </div>
									  </div>
									  <strong style="font-size:16px;">Informações Adicionais:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-3">
									      <label for="txtPessoa">Tipo de pessoa:</label><br>
  											<input type="radio" name="txtPessoa" value="F" <%= (contato.getPessoa().equals("F")) ? "checked" : "" %> disabled style="margin-left:10px;"><span style="margin-left:4px;">Física</span>
  											<input type="radio" name="txtPessoa" value="J" <%= (contato.getPessoa().equals("J")) ? "checked" : "" %> disabled style="margin-left:10px;"><span style="margin-left:4px;">Jurídica</span>
									    </div>
									    <div class="form-group col-md-9">
									      <label for="txtContato">Contato:</label>
									      <input type="text" class="form-control" name="txtContato" value="<%= contato.getContato() %>" disabled>
									    </div>
									  </div>
									  <hr style="margin-top: 0px;">
							  		<a href="contatos.jsp" class="btn btn-info">Voltar para lista de contatos</a>
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