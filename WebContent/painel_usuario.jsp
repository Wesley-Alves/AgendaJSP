<div class="panel panel-primary">
	<div class="panel-heading">
    <img src="imagens/user24.png" alt="Usuário" style="margin-right:10px;width:20px;height:20px;">Usuário
  </div>
  <div class="panel-body">
    <p><strong>Usuário: </strong><a href="editar_usuario.jsp"><%= usuario.getNome() %></a></p>
    <p><strong>Dt. Nasc: </strong><%= FormatarData.formatar(usuario.getDtNascimento()) %></p>
    <p><strong>Cidade: </strong><%= usuario.getCidade() %></p>
    <p><strong>Data: </strong> <%= FormatarData.formatar(new Date()) %></p>
    <a href="logoff.jsp"><img src="imagens/logout16.png" alt="Sair" style="margin-right:5px;">Sair do sistema</a>
  </div>
</div>