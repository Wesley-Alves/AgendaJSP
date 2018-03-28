<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<%
	if (session.getAttribute("usuario") != null) {
	  response.sendRedirect("index.jsp");
	} else {
%>
		<html>
		  <head>
				<meta charset="UTF-8">
		    <title>Registro</title>
		    <link rel="stylesheet" href="css/bootstrap.css">
		  </head>
		  <body>
				<div class="container" style="box-shadow: 3px 3px 5px gray; border-radius: 10px; border: 1px dotted;">
					<%@ include file="cabecalho.html" %>
					<div class="row" style="margin-top:79px;">
						<div class="col-md-3">
						</div>
						<div class="col-md-6">
							<div class="panel panel-primary">
							  <div class="panel-heading" style="font-size:35px;">
							  	<img src="imagens/users32.png" style="margin-right:10px;" alt="Login">Cadastro
								</div>
								<div class="panel-body">
									<form action="CadastrarUsuarioServlet" method="POST">
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtNome">Nome:</label>
									      <input type="text" class="form-control" name="txtNome" placeholder="Digite seu nome..." required>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtEmail">E-mail:</label>
									      <input type="email" class="form-control" name="txtEmail" placeholder="Digite seu email..." required>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-12">
									      <label for="txtSenha">Senha:</label>
									      <input type="password" class="form-control" name="txtSenha" placeholder="Digite sua senha..." required>
									    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-6">
									      <label for="txtCidade">Cidade:</label>
									      <input type="text" class="form-control" name="txtCidade" placeholder="Digite sua cidade...">
									    </div>
										    <div class="form-group col-md-6">
										      <label for="txtDtNascimento">Data de Nascimento:</label>
										      <input type="text" class="form-control" name="txtDtNascimento" placeholder="Digite sua data de nascimento..." required>
										    </div>
									  </div>
									  <div class="form-row">
									    <div class="form-group col-md-5">
									      <label for="txtSexo">Sexo:</label><br>
													<input type="radio" name="txtSexo" value="M" checked style="margin-left:10px;"><span style="margin-left:4px;">Masculino</span>
													<input type="radio" name="txtSexo" value="F" style="margin-left:10px;"><span style="margin-left:4px;">Feminino</span>
									    </div>
									    <div class="form-group col-md-7">
									      <label for="txtTelefone">Telefone:</label>
									      <input type="text" class="form-control" name="txtTelefone" placeholder="Digite seu telefone...">
									    </div>
									  </div>
									  <hr style="margin-top: 0px;">
									  <button type="submit" class="btn btn-success">Confirmar registro</button>
									  <button type="reset" class="btn btn-warning">Limpar campos</button>
									</form>
								</div>
						  </div>	
						</div>
						<div class="col-md-3">
						</div>
					</div>
					<div class="row" style="margin-top:79px;"></div>
					<%@ include file="rodape.html" %>
				</div>
		  </body>
		</html>
<%}%>