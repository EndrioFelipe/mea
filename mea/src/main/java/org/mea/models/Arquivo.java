package org.mea.models;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Arquivo {
	
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int id;
		private String nome;
		private String pasta;
		
		@Lob
		private String descricao;
		private String arquivoPath;
		
		@DateTimeFormat
		private Calendar dataUpload;
		
				
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getNome() {
			return nome;
		}
	
		public void setNome(String nome) {
			this.nome = nome;
		}
		
		public String getPasta() {
			return pasta;
		}

		public void setPasta(String pasta) {
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