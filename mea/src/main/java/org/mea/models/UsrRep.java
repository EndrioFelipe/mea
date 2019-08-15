package org.mea.models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UsrRep {
	@Id
	private String siape;
	private String nome;
	private String codUo;
	private String nomeReg;
	private String aaa;
	private String ddd;
	public String getSiape() {
		return siape;
	}
	public void setSiape(String siape) {
		this.siape = siape;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCodUo() {
		return codUo;
	}
	public void setCodUo(String codUo) {
		this.codUo = codUo;
	}
	public String getNomeReg() {
		return nomeReg;
	}
	public void setNomeReg(String nomeReg) {
		this.nomeReg = nomeReg;
	}
	public String getAaa() {
		return aaa;
	}
	public void setAaa(String aaa) {
		this.aaa = aaa;
	}
	public String getDdd() {
		return ddd;
	}
	public void setDdd(String ddd) {
		this.ddd = ddd;
	}
	
	
}
