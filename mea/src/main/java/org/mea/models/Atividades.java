package org.mea.models;

import java.util.Calendar;
import java.util.List;


import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Atividades {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String descricao;
	@DateTimeFormat
	private Calendar dataInicio;
	
	@ElementCollection 
	private List<Funcionarios> func;
	
	@Enumerated(EnumType.STRING)
	private Estados status;
	private int porcentagem;
	
	@Lob
	private String observacoes;
	private String prioridade;
	private String arquivoPath;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Calendar getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(Calendar dataInicio) {
		this.dataInicio = dataInicio;
	}
		
	public List<Funcionarios> getFunc() {
		
		return func;
	}
	public void setFunc(List<Funcionarios> func) {
		
		System.out.println("o q ta recebendo: "+func);
		this.func = func;
	}		
	
	public Estados getStatus() {
		return status;
	}
	public void setStatus(Estados status) {
		this.status = status;
	}
	public int getPorcentagem() {
		return porcentagem;
	}
	public void setPorcentagem(int porcentagem) {
		this.porcentagem = porcentagem;
	}
	public String getObservacoes() {
		return observacoes;
	}
	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}
	public String getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(String prioridade) {
		this.prioridade = prioridade;
	}
	
	public String getArquivoPath() {
		return arquivoPath;
	}
	public void setArquivoPath(String arquivoPath) {
		this.arquivoPath = arquivoPath;
	}

	/*	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Atividades other = (Atividades) obj;
		if (id != other.id)
			return false;
		return true;
	}*/
		
	
}
