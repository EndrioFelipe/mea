package org.mea.models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UsuarioTemp {
	
	@Id
	private String siape;
	
	private String nome;
	
	private String codUo;
	
	private String regional;

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

	public String getRegional() {
		return regional;
	}

	public void setRegional(String regional) {
		this.regional = regional;
	}
}
