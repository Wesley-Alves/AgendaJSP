package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.ContatoDAO;
import br.senai.sp.modelo.Contato;

@WebServlet("/ListarContatoServlet")
public class ListarContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ListarContatoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		String target = request.getParameter("tela");
		String arquivo;
		if (target.equals("editar")) {
			arquivo = "editar_contato.jsp";
		} else if (target.equals("excluir")) {
			arquivo = "excluir_contato.jsp";
		} else {
			arquivo = "consultar_contato.jsp";
		}
		
		ContatoDAO contatoDao = new ContatoDAO();
		Contato contato = contatoDao.getContato(id);
		request.setAttribute("contato", contato);
		RequestDispatcher rd = request.getRequestDispatcher(arquivo);
		rd.forward(request, response);
	}
}