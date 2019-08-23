package org.mea.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.mea.daos.PendenciaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Pendencias implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	PendenciaDAO pendenciaDAO;
	
	
	
	public String getAbc() { //tem que ter o get na frente pra poder ser chamado na view, no caso lá apenas como ${quantidadeUsuarios.abc}
		
		return "endrio";
	}
	
	public int getQuantidade(){
		List<TiposPendencias> pendenciasQtd = pendenciaDAO.listarChecados();
		System.out.println(" método getQuantidade sem parâmetros");
		
		//return pendenciasQtd.values().stream().reduce(0, (itensDaLista, oCaraQueSoma) -> itensDaLista + oCaraQueSoma);
		
		return pendenciasQtd.size() != 0 ? pendenciasQtd.size() : 0;
		
	}
	
//	public void add(String item) {
//		System.out.println("add");
//		int cont = 0;
////		pendenciasQtd.forEach(iterador -> { 			
////				if(iterador == item) {
////					cont++;
////					break;
////				}									
////			});
//		
//		if(cont == 0) {
//			pendenciasQtd.add(item);
//		}
//		 //o getQuantidade é a quantidade de itens q ele já tem, então coloca +1 se ele for add mais um item
//	}
//	
//	public int getQuantidade(String siape) {//esse método deve retornar o número de vezes em que o produto foi 
//				  //encontrado na lista e somar 1 a essa quantidade
//		if (!pendenciasQtd.contains(siape)) {
//		pendenciasQtd.put(siape, 0);//Caso o item não exista na lista, colocamos o item e retornamos o valor 0, que será
//		//incrementado pelo metódo put
//		}
//		return pendenciasQtd.get(siape); //caso o item já exista, retornamos apenas o valor que representa a quantidade de vezes 
//		//que o produto foi adicionado na lista.
//	}
	
}
