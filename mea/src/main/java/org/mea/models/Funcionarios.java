package org.mea.models;

import javax.persistence.Embeddable;
import javax.persistence.Entity;

@Embeddable
public class Funcionarios {

	private String nome;
		
	public String getNome() {
		if(nome.equals(null)) {
			throw new NullPointerException();
		} else {
			return nome;
		}
		
	}

	public void setNome(String nome) {
		
		this.nome = nome;
	}
	
	
}
