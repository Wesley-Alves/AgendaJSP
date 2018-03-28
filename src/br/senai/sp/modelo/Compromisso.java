package br.senai.sp.modelo;

import java.sql.Time;
import java.util.Date;

public class Compromisso {
	private int id;
	private Date dtInicio;
	private Date dtFim;
	private Time hrInicio;
	private Time hrFim;
	private String local;
	private int prioridade;
	private String assunto;
	private String descricao;
	private String contato;
	private int idUsuario;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDtInicio() {
		return dtInicio;
	}

	public void setDtInicio(Date dtInicio) {
		this.dtInicio = dtInicio;
	}

	public Date getDtFim() {
		return dtFim;
	}

	public void setDtFim(Date dtFim) {
		this.dtFim = dtFim;
	}

	public Time getHrInicio() {
		return hrInicio;
	}

	public void setHrInicio(Time hrInicio) {
		this.hrInicio = hrInicio;
	}

	public Time getHrFim() {
		return hrFim;
	}

	public void setHrFim(Time hrFim) {
		this.hrFim = hrFim;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public int getPrioridade() {
		return prioridade;
	}

	public void setPrioridade(int prioridade) {
		this.prioridade = prioridade;
	}

	public String getAssunto() {
		return assunto;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getContato() {
		return contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
}