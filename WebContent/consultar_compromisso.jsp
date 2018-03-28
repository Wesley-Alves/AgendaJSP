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
				<title>Consultar Compromisso</title>
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
							    <img src="imagens/detalhescompromisso32.png" alt="Detalhes" style="margin-right:10px;width:32px;height:32px;">Detalhes do Compromisso
							  </div>
							  <div class="panel-body">
							  	<form>
									  <strong style="font-size:16px;">Data e Horário:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-6">
									      <label for="txtDtInicio">Data do Início:</label>
									      <input type="text" class="form-control" name="txtDtInicio" value="<%= FormatarData.formatar(compromisso.getDtInicio()) %>" disabled>
									    </div>
									    <div class="form-group col-md-6">
									      <label for="txtDtFim">Data do Fim:</label>
									      <input type="text" class="form-control" name="txtDtFim" value="<%= FormatarData.formatar(compromisso.getDtFim()) %>" disabled>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-6">
									      <label for="txtHrInicio">Horário do Início:</label>
									      <input type="text" class="form-control" name="txtHrInicio" value="<%= compromisso.getHrInicio() %>" disabled>
									    </div>
									    <div class="form-group col-md-6">
									      <label for="txtHrFim">Horário do Fim:</label>
									      <input type="text" class="form-control" name="txtHrFim" value="<%= compromisso.getHrFim() %>" disabled>
									    </div>
									  </div>
									  <strong style="font-size:16px;">Informações Adicionais:</strong>
									  <hr style="margin-top:10px;margin-bottom:10px;">
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtLocal">Local:</label>
									      <input type="text" class="form-control" name="txtLocal" value="<%= compromisso.getLocal() %>" disabled>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-8">
									      <label for="txtAssunto">Assunto:</label>
									      <input type="text" class="form-control" name="txtAssunto" value="<%= compromisso.getAssunto() %>" disabled>
									    </div>
									    <div class="form-group col-md-4">
									      <label for="txtPrioridade">Prioridade:</label>
									      <select name="txtPrioridade" class="form-control" disabled>
													<option value="1" <%= (compromisso.getPrioridade() == 1) ? "selected" : "" %>>Baixa</option>
													<option value="2" <%= (compromisso.getPrioridade() == 2) ? "selected" : "" %>>Média</option>
													<option value="3" <%= (compromisso.getPrioridade() == 3) ? "selected" : "" %>>Alta</option>
													<option value="4" <%= (compromisso.getPrioridade() == 4) ? "selected" : "" %>>Muito Alta</option>
									      </select>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtDescricao">Descrição:</label>
									      <input type="text" class="form-control" name="txtDescricao" value="<%= compromisso.getDescricao() %>" disabled>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtContato">Contato:</label>
									      <input type="text" class="form-control" name="txtContato" value="<%= compromisso.getContato() %>" disabled>
									    </div>
									  </div>
									  <hr style="margin-top: 0px;">
							  		<a href="compromissos.jsp" class="btn btn-info">Voltar para lista de compromissos</a>
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