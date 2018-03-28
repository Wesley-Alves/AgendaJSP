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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("txtEmail");
		String senha = request.getParameter("txtSenha");

		UsuarioDAO usuarioDao = new UsuarioDAO();
		Usuario usuario = usuarioDao.autenticar(email, senha);
		
		if (usuario != null) {
			HttpSession sessao = request.getSession();
			sessao.setAttribute("usuario", usuario);
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("login.jsp?erro=1");
		}
	}
}