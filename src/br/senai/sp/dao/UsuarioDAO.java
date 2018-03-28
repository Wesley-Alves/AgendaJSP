package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.senai.sp.jdbc.Conexao;
import br.senai.sp.modelo.Usuario;

public class UsuarioDAO {
	public Usuario autenticar(String email, String senha) {
		Usuario usuario = null;
		Connection con = Conexao.abrirConexao();
		String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ? AND ativo = 1";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, senha);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSexo(rs.getString("Sexo"));
				usuario.setSenha("");
				usuario.setDtNascimento(rs.getDate("dtNascimento"));
				usuario.setEmail(rs.getString("email"));
				usuario.setCidade(rs.getString("cidade"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setSalario(rs.getDouble("salario"));
				usuario.setAtivo(true);
			}
			
			Conexao.fecharConexao();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return usuario;
	}
	
	public void gravar(Usuario usuario) {
		Connection con = Conexao.abrirConexao();
		String sql = "INSERT INTO usuario (nome, sexo, senha, dtNascimento, email, cidade, telefone, ativo) VALUES (?, ?, ?, ?, ?, ?, ?, 1)";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getSexo());
			stm.setString(3, usuario.getSenha());
			stm.setDate(4, new Date(usuario.getDtNascimento().getTime()));
			stm.setString(5, usuario.getEmail());
			stm.setString(6, usuario.getCidade());
			stm.setString(7, usuario.getTelefone());
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void atualizar(Usuario usuario) {
		Connection con = Conexao.abrirConexao();
		String sql = "UPDATE usuario SET nome = ?, sexo = ?, dtNascimento = ?, email = ?, cidade = ?, telefone = ? WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getSexo());
			stm.setDate(3, new Date(usuario.getDtNascimento().getTime()));
			stm.setString(4, usuario.getEmail());
			stm.setString(5, usuario.getCidade());
			stm.setString(6, usuario.getTelefone());
			stm.setInt(7, usuario.getId());
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void atualizarSenha(Usuario usuario) {
		Connection con = Conexao.abrirConexao();
		String sql = "UPDATE usuario SET senha = ? WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getSenha());
			stm.setInt(2, usuario.getId());
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}