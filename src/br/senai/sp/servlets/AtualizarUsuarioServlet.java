package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.modelo.Usuario;
import br.senai.sp.util.FormatarData;

@WebServlet("/AtualizarUsuarioServlet")
public class AtualizarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AtualizarUsuarioServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		Usuario usuarioAtual = (Usuario) sessao.getAttribute("usuario");
		Usuario usuario = new Usuario();
		usuario.setNome(request.getParameter("txtNome"));
		usuario.setEmail(request.getParameter("txtEmail"));
		usuario.setSenha(request.getParameter("txtSenha"));
		usuario.setCidade(request.getParameter("txtCidade"));
		usuario.setDtNascimento(FormatarData.getData(request.getParameter("txtDtNascimento")));
		usuario.setCidade(request.getParameter("txtCidade"));
		usuario.setSexo(request.getParameter("txtSexo"));
		usuario.setTelefone(request.getParameter("txtTelefone"));
		usuario.setId(usuarioAtual.getId());
		
		UsuarioDAO usuarioDao = new UsuarioDAO();
		usuarioDao.atualizar(usuario);
		if (usuario.getSenha().length() > 0) {
			usuarioDao.atualizarSenha(usuario);
		}
		
		sessao.setAttribute("usuario", usuario);
		response.sendRedirect("usuario_editado.jsp");
	}
}