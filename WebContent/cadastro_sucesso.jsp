<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
					<div class="panel panel-success">
					  <div class="panel-heading" style="font-size:35px;">
					  	<img src="imagens/ok48.png" alt="Sucesso" style="margin-right:10px;">Bem-vindo
						</div>
						<div class="panel-body">
							<p>Registro efetuado com sucesso !</p>
            	<p><a href="login.jsp">Efetuar login</a></p>
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