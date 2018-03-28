package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.modelo.Usuario;
import br.senai.sp.util.FormatarData;

@WebServlet("/CadastrarUsuarioServlet")
public class CadastrarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CadastrarUsuarioServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		usuario.setNome(request.getParameter("txtNome"));
		usuario.setEmail(request.getParameter("txtEmail"));
		usuario.setSenha(request.getParameter("txtSenha"));
		usuario.setCidade(request.getParameter("txtCidade"));
		usuario.setDtNascimento(FormatarData.getData(request.getParameter("txtDtNascimento")));
		usuario.setCidade(request.getParameter("txtCidade"));
		usuario.setSexo(request.getParameter("txtSexo"));
		usuario.setTelefone(request.getParameter("txtTelefone"));
		
		UsuarioDAO usuarioDao = new UsuarioDAO();
		usuarioDao.gravar(usuario);
		
		response.sendRedirect("cadastro_sucesso.jsp");
	}
}