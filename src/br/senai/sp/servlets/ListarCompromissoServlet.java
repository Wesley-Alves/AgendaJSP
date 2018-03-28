package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.modelo.Compromisso;

@WebServlet("/ListarCompromissoServlet")
public class ListarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListarCompromissoServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		String target = request.getParameter("tela");
		String arquivo;
		if (target.equals("editar")) {
			arquivo = "editar_compromisso.jsp";
		} else if (target.equals("excluir")) {
			arquivo = "excluir_compromisso.jsp";
		} else {
			arquivo = "consultar_compromisso.jsp";
		}
		
		CompromissoDAO compromissoDao = new CompromissoDAO();
		Compromisso compromisso = compromissoDao.getCompromisso(id);
		request.setAttribute("compromisso", compromisso);
		RequestDispatcher rd = request.getRequestDispatcher(arquivo);
		rd.forward(request, response);
	}
}