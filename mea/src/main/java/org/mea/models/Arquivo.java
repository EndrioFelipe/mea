package org.mea.models;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Arquivo {
	
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private Integer id;
		private String nome;
		@ManyToOne(fetch=FetchType.EAGER)
		private Pasta pasta;
		
		@Lob
		private String descricao;
		private String arquivoPath;
		
		@DateTimeFormat
		private Calendar dataUpload;
		
				
		

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getNome() {
			return nome;
		}
	
		public void setNome(String nome) {
			this.nome = nome;
		}
		
		public Pasta getPasta() {
			return pasta;
		}

		public void setPasta(Pasta pasta) {
			this.pasta = pasta;
		}

		public String getDescricao() {
			return descricao;
		}
	
		public void setDescricao(String descricao) {
			this.descricao = descricao;
		}
	
		public String getArquivoPath() {
			return arquivoPath;
		}
	
		public void setArquivoPath(String arquivoPath) {
			this.arquivoPath = arquivoPath;
		}
	
		public Calendar getDataUpload() {
			return dataUpload;
		}
	
		public void setDataUpload(Calendar dataUpload) {
			this.dataUpload = dataUpload;
		}
			
	
}