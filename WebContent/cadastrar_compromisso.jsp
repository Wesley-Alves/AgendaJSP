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
				<title>Cadastrar Compromisso</title>
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
							    <img src="imagens/calendario48.png" alt="Calend�rio" style="margin-right:10px;width:32px;height:32px;">Novo Compromisso
							  </div>
							  <div class="panel-body">
							  	<form action="GravarCompromissoServlet" method="POST">
							  		<input type="hidden" name="txtIdUsuario" value="<%= usuario.getId() %>">
									  <strong style="font-size:16px;">Data e Hor�rio:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-6">
									      <label for="txtDtInicio">Data do In�cio:</label>
									      <input type="text" class="form-control" name="txtDtInicio" placeholder="Digite a data do in�cio..." required>
									    </div>
									    <div class="form-group col-md-6">
									      <label for="txtDtFim">Data do Fim:</label>
									      <input type="text" class="form-control" name="txtDtFim" placeholder="Digite a data do fim..." required>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-6">
									      <label for="txtHrInicio">Hor�rio do In�cio:</label>
									      <input type="text" class="form-control" name="txtHrInicio" placeholder="Digite o hor�rio do in�cio..." required>
									    </div>
									    <div class="form-group col-md-6">
									      <label for="txtHrFim">Hor�rio do Fim:</label>
									      <input type="text" class="form-control" name="txtHrFim" placeholder="Digite o hor�rio do fim..." required>
									    </div>
									  </div>
									  <strong style="font-size:16px;">Informa��es Adicionais:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtLocal">Local:</label>
									      <input type="text" class="form-control" name="txtLocal" placeholder="Digite o local do compromisso..." required>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-8">
									      <label for="txtAssunto">Assunto:</label>
									      <input type="text" class="form-control" name="txtAssunto" placeholder="Digite o assunto.." required>
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtPrioridade">Prioridade:</label>
									      <select name="txtPrioridade" class="form-control">
													<option value="1">Baixa</option>
													<option value="2">M�dia</option>
													<option value="3">Alta</option>
													<option value="4">Muito Alta</option>
									      </select>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtDescricao">Descri��o:</label>
									      <input type="text" class="form-control" name="txtDescricao" placeholder="Digite a descri��o do compromisso..." required>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtContato">Contato:</label>
									      <input type="text" class="form-control" name="txtContato" placeholder="Digite o contato...">
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