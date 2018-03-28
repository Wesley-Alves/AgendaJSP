<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%
	if (session.getAttribute("usuario") != null) {
	  response.sendRedirect("index.jsp");
	} else {
		String erro = "";
		try {
			erro = request.getParameter("erro").toString();
		} catch (Exception e) {
		}
%>
		<!DOCTYPE html>
		<html>
		  <head>
				<meta charset="UTF-8">
		    <title>Login</title>
		    <link rel="stylesheet" href="css/bootstrap.css">
		  </head>
		  <body>
				<div class="container" style="box-shadow: 3px 3px 5px gray; border-radius: 10px; border: 1px dotted;">
					<%@ include file="cabecalho.html" %>
					<div class="row" style="margin-top:79px;">
						<div class="col-md-4">
						</div>
						<div class="col-md-4">
							<div class="panel panel-primary">
							  <div class="panel-heading" style="font-size:35px;">
							  	<img src="imagens/login48.png" alt="Login">Login
								</div>
								<div class="panel-body">
									<form action="LoginServlet" method="POST">
									  <div class="form-group">
									    <%if (erro.equals("1")) { %>
									    		<div class="alert alert-danger">Ops! Usuário ou senha incorretos!</div>
									    <% } %>
									    <label for="email">E-mail</label>
									    <input type="email" class="form-control" id="email" name="txtEmail">
									  </div>
									  <div class="form-group">
									    <label for="pwd">Senha</label>
									    <input type="password" class="form-control" id="pwd" name="txtSenha">
									  </div>
									  <button type="submit" class="btn btn-success">Efetuar Login</button>
									  <p class="pull-right" style="margin-top:5px;"><a href="cadastro.jsp">Quero me cadastrar</a></p>
									</form>
								</div>
						  </div>	
						</div>
						<div class="col-md-4">
						</div>
					</div>
					<div class="row" style="margin-top:79px;"></div>
					<%@ include file="rodape.html" %>
				</div>
		  </body>
		</html>
<%}%>