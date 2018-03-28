package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.senai.sp.jdbc.Conexao;
import br.senai.sp.modelo.Contato;

public class ContatoDAO {
	public ArrayList<Contato> pegarContatos(int idUsuario) {
		ArrayList<Contato> contatos = new ArrayList<>();
		Connection con = Conexao.abrirConexao();
		String sql = "SELECT * FROM contato WHERE idUsuario = ? ORDER BY nome ASC";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idUsuario);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				Contato contato = new Contato();
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setCelular(rs.getString("celular"));
				contato.setLogradouro(rs.getString("logradouro"));
				contato.setBairro(rs.getString("bairro"));
				contato.setCidade(rs.getString("cidade"));
				contato.setEstado(rs.getString("estado"));
				contato.setCep(rs.getString("cep"));
				contato.setPessoa(rs.getString("pessoa"));
				contato.setContato(rs.getString("contato"));
				contato.setDtNascimento(rs.getDate("dtNascimento"));
				contato.setIdUsuario(rs.getInt("idUsuario"));
				contatos.add(contato);
			}
			
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return contatos;
	}
	
	public Contato getContato(int id) {
		Contato contato = null;
		Connection con = Conexao.abrirConexao();
		String sql = "SELECT * FROM contato WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				contato = new Contato();
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setCelular(rs.getString("celular"));
				contato.setLogradouro(rs.getString("logradouro"));
				contato.setBairro(rs.getString("bairro"));
				contato.setCidade(rs.getString("cidade"));
				contato.setEstado(rs.getString("estado"));
				contato.setCep(rs.getString("cep"));
				contato.setPessoa(rs.getString("pessoa"));
				contato.setContato(rs.getString("contato"));
				contato.setDtNascimento(rs.getDate("dtNascimento"));
				contato.setIdUsuario(rs.getInt("idUsuario"));
			}
			
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return contato;
	}
	
	public void gravar(Contato contato) {
		Connection con = Conexao.abrirConexao();
		String sql = "INSERT INTO contato (nome, email, telefone, celular, logradouro, bairro, cidade, estado, cep, pessoa, contato, dtNascimento, idUsuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getEmail());
			stm.setString(3, contato.getTelefone());
			stm.setString(4, contato.getCelular());
			stm.setString(5, contato.getLogradouro());
			stm.setString(6, contato.getBairro());
			stm.setString(7, contato.getCidade());
			stm.setString(8, contato.getEstado());
			stm.setString(9, contato.getCep());
			stm.setString(10, contato.getPessoa());
			stm.setString(11, contato.getContato());
			stm.setDate(12, new Date(contato.getDtNascimento().getTime()));
			stm.setInt(13, contato.getIdUsuario());
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(int id) {
		Connection con = Conexao.abrirConexao();
		String sql = "DELETE FROM contato WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, id);
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void atualizar(Contato contato) {
		Connection con = Conexao.abrirConexao();
		String sql = "UPDATE contato SET nome = ?, email = ?, telefone = ?, celular = ?, logradouro = ?, bairro = ?, cidade = ?, estado = ?, cep = ?, pessoa = ?, contato = ?, dtNascimento = ? WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getEmail());
			stm.setString(3, contato.getTelefone());
			stm.setString(4, contato.getCelular());
			stm.setString(5, contato.getLogradouro());
			stm.setString(6, contato.getBairro());
			stm.setString(7, contato.getCidade());
			stm.setString(8, contato.getEstado());
			stm.setString(9, contato.getCep());
			stm.setString(10, contato.getPessoa());
			stm.setString(11, contato.getContato());
			stm.setDate(12, new Date(contato.getDtNascimento().getTime()));
			stm.setInt(13, contato.getId());
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}