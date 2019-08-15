package org.mea.models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TiposPendencias {
	
	@Id
	private int id;
	
	private String tipoPendencia;
	
} 
