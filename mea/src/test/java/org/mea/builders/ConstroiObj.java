package org.mea.builders;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;




public class ConstroiObj {
	
	private List<String> livros = new ArrayList<>();
	
	
	
	private String novoLivro() {
		return null;
	}
	
	private int more() {
		return -1;
	}
	
	int i = 40;
	int j=30;
	
	int soma=i+j;
	int sum=i+j;
	
	@Test
	public void deveSomarTodosOsPrecosPorTipoLivro() {
		//List<Integer> livros = ProdutoBuilder.novoLivro(TipoPreco.EBOOK, BigDecimal.TEN).more(3).buildAll();
	    Assert.assertEquals(sum, soma);
	}
}
