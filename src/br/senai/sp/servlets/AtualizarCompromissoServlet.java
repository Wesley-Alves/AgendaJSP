package br.senai.sp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.modelo.Compromisso;
import br.senai.sp.util.FormatarData;

@WebServlet("/AtualizarCompromissoServlet")
public class AtualizarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AtualizarCompromissoServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Compromisso compromisso = new Compromisso();
		compromisso.setId(Integer.valueOf(request.getParameter("txtId")));
		compromisso.setDtInicio(FormatarData.getData(request.getParameter("txtDtInicio")));
		compromisso.setDtFim(FormatarData.getData(request.getParameter("txtDtFim")));
		compromisso.setHrInicio(FormatarData.getHorario(request.getParameter("txtHrInicio")));
		compromisso.setHrFim(FormatarData.getHorario(request.getParameter("txtHrFim")));
		compromisso.setLocal(request.getParameter("txtLocal"));
		compromisso.setPrioridade(Integer.valueOf(request.getParameter("txtPrioridade")));
		compromisso.setAssunto(request.getParameter("txtAssunto"));
		compromisso.setDescricao(request.getParameter("txtDescricao"));
		compromisso.setContato(request.getParameter("txtContato"));
		
		CompromissoDAO compromissoDao = new CompromissoDAO();
		compromissoDao.atualizar(compromisso);
		
		response.sendRedirect("compromissos.jsp");
	}
}