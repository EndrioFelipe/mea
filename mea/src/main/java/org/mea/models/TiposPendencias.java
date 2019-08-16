package org.mea.models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TiposPendencias {
	
	@Id	
	private String codigoPendencia;
	
	private String nomeRquisitante;
	
	private String tipoPendencia;
	
	private boolean situacao;	
	
	
	@Deprecated
	public TiposPendencias() {
	}

	public TiposPendencias(String codigoPendencia, String nomeRquisitante, String tipoPendencia, boolean situacao) {
		super();
		this.codigoPendencia = codigoPendencia;
		this.nomeRquisitante = nomeRquisitante;
		this.tipoPendencia = tipoPendencia;
		this.situacao = situacao;
	}

	public String getCodigoPendencia() {
		return codigoPendencia;
	}

	public void setCodigoPendencia(String codigoPendencia) {
		this.codigoPendencia = codigoPendencia;
	}

	public String getNomeRquisitante() {
		return nomeRquisitante;
	}

	public void setNomeRquisitante(String nomeRquisitante) {
		this.nomeRquisitante = nomeRquisitante;
	}

	public String getTipoPendencia() {
		return tipoPendencia;
	}

	public void setTipoPendencia(String tipoPendencia) {
		this.tipoPendencia = tipoPendencia;
	}

	public boolean isSituacao() {
		return situacao;
	}

	public void setSituacao(boolean situacao) {
		this.situacao = situacao;
	}
	
} 
