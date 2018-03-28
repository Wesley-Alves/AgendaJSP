package br.senai.sp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.ContatoDAO;
import br.senai.sp.modelo.Contato;
import br.senai.sp.util.FormatarData;

@WebServlet("/AtualizarContatoServlet")
public class AtualizarContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AtualizarContatoServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Contato contato = new Contato();
		contato.setId(Integer.valueOf(request.getParameter("txtId")));
		contato.setNome(request.getParameter("txtNome"));
		contato.setEmail(request.getParameter("txtEmail"));
		contato.setTelefone(request.getParameter("txtTelefone"));
		contato.setCelular(request.getParameter("txtCelular"));
		contato.setLogradouro(request.getParameter("txtLogradouro"));
		contato.setBairro(request.getParameter("txtBairro"));
		contato.setCidade(request.getParameter("txtCidade"));
		contato.setEstado(request.getParameter("txtEstado"));
		contato.setCep(request.getParameter("txtCep"));
		contato.setPessoa(request.getParameter("txtPessoa"));
		contato.setContato(request.getParameter("txtContato"));
		contato.setDtNascimento(FormatarData.getData(request.getParameter("txtDtNascimento")));
		
		ContatoDAO contatoDao = new ContatoDAO();
		contatoDao.atualizar(contato);
		
		response.sendRedirect("contatos.jsp");
	}
}