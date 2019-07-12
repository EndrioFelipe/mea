package org.mea.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.Atividades;
import org.mea.models.Funcionarios;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class AtividadeDAO {
	@PersistenceContext
    private EntityManager manager;
	
	public void gravar(Atividades atividade){
		Funcionarios f = new Funcionarios();
		System.out.println("descricao: "+atividade.getDescricao());
		atividade.setPorcentagem(51);
        manager.persist(atividade);
    }
	
	
	
}
