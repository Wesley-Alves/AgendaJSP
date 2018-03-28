package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.senai.sp.jdbc.Conexao;
import br.senai.sp.modelo.Compromisso;

public class CompromissoDAO {
	public ArrayList<Compromisso> pegarCompromissos(int idUsuario) {
		ArrayList<Compromisso> compromissos = new ArrayList<>();
		Connection con = Conexao.abrirConexao();
		String sql = "SELECT * FROM compromisso WHERE idUsuario = ? ORDER BY dtInicio DESC";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idUsuario);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				Compromisso compromisso = new Compromisso();
				compromisso.setId(rs.getInt("id"));
				compromisso.setDtInicio(rs.getDate("dtInicio"));
				compromisso.setDtFim(rs.getDate("dtFim"));
				compromisso.setHrInicio(rs.getTime("hrInicio"));
				compromisso.setHrFim(rs.getTime("hrFim"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setPrioridade(rs.getInt("prioridade"));
				compromisso.setAssunto(rs.getString("assunto"));
				compromisso.setDescricao(rs.getString("descricao"));
				compromisso.setContato(rs.getString("contato"));
				compromisso.setIdUsuario(rs.getInt("idUsuario"));
				compromissos.add(compromisso);
			}
			
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return compromissos;
	}
	
	public Compromisso getCompromisso(int id) {
		Compromisso compromisso = null;
		Connection con = Conexao.abrirConexao();
		String sql = "SELECT * FROM compromisso WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				compromisso = new Compromisso();
				compromisso.setId(rs.getInt("id"));
				compromisso.setDtInicio(rs.getDate("dtInicio"));
				compromisso.setDtFim(rs.getDate("dtFim"));
				compromisso.setHrInicio(rs.getTime("hrInicio"));
				compromisso.setHrFim(rs.getTime("hrFim"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setPrioridade(rs.getInt("prioridade"));
				compromisso.setAssunto(rs.getString("assunto"));
				compromisso.setDescricao(rs.getString("descricao"));
				compromisso.setContato(rs.getString("contato"));
				compromisso.setIdUsuario(rs.getInt("idUsuario"));
			}
			
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return compromisso;
	}
	
	public ArrayList<Compromisso> pegarProximosCompromissos(int idUsuario) {
		ArrayList<Compromisso> compromissos = new ArrayList<>();
		Connection con = Conexao.abrirConexao();
		String sql = "SELECT * FROM compromisso WHERE idUsuario = ? AND dtInicio >= CURRENT_DATE() ORDER BY dtInicio ASC LIMIT 6";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idUsuario);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				Compromisso compromisso = new Compromisso();
				compromisso.setId(rs.getInt("id"));
				compromisso.setDtInicio(rs.getDate("dtInicio"));
				compromisso.setDtFim(rs.getDate("dtFim"));
				compromisso.setHrInicio(rs.getTime("hrInicio"));
				compromisso.setHrFim(rs.getTime("hrFim"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setPrioridade(rs.getInt("prioridade"));
				compromisso.setAssunto(rs.getString("assunto"));
				compromisso.setDescricao(rs.getString("descricao"));
				compromisso.setContato(rs.getString("contato"));
				compromisso.setIdUsuario(rs.getInt("idUsuario"));
				compromissos.add(compromisso);
			}
			
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return compromissos;
	}
	
	public void gravar(Compromisso compromisso) {
		Connection con = Conexao.abrirConexao();
		String sql = "INSERT INTO compromisso (dtInicio, dtFim, hrInicio, hrFim, local, prioridade, assunto, descricao, contato, idUsuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setDate(1, new Date(compromisso.getDtInicio().getTime()));
			stm.setDate(2, new Date(compromisso.getDtFim().getTime()));
			stm.setTime(3, compromisso.getHrInicio());
			stm.setTime(4, compromisso.getHrFim());
			stm.setString(5, compromisso.getLocal());
			stm.setInt(6, compromisso.getPrioridade());
			stm.setString(7, compromisso.getAssunto());
			stm.setString(8, compromisso.getDescricao());
			stm.setString(9, compromisso.getContato());
			stm.setInt(10, compromisso.getIdUsuario());
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(int id) {
		Connection con = Conexao.abrirConexao();
		String sql = "DELETE FROM compromisso WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, id);
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void atualizar(Compromisso compromisso) {
		Connection con = Conexao.abrirConexao();
		String sql = "UPDATE compromisso SET dtInicio = ?, dtFim = ?, hrInicio = ?, hrFim = ?, local = ?, prioridade = ?, assunto = ?, descricao = ?, contato = ? WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setDate(1, new Date(compromisso.getDtInicio().getTime()));
			stm.setDate(2, new Date(compromisso.getDtFim().getTime()));
			stm.setTime(3, compromisso.getHrInicio());
			stm.setTime(4, compromisso.getHrFim());
			stm.setString(5, compromisso.getLocal());
			stm.setInt(6, compromisso.getPrioridade());
			stm.setString(7, compromisso.getAssunto());
			stm.setString(8, compromisso.getDescricao());
			stm.setString(9, compromisso.getContato());
			stm.setInt(10, compromisso.getId());
			stm.execute();
			Conexao.fecharConexao();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}