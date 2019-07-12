package org.mea.models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class RepFuncionarios {
	@Id
	private String nome;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
}
