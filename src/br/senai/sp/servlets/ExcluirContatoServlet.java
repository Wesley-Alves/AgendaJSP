package br.senai.sp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.ContatoDAO;

@WebServlet("/ExcluirContatoServlet")
public class ExcluirContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ExcluirContatoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		ContatoDAO contatoDao = new ContatoDAO();
		contatoDao.excluir(id);
		response.sendRedirect("contatos.jsp");
	}
}