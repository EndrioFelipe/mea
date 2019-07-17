package org.mea.daos;

import java.util.List;

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
        manager.persist(atividade);
    }
	
	
	public List<Atividades> listar() {
		return manager.createQuery("select distinct(a) from Atividades a join fetch a.func", 
				Atividades.class).getResultList();
	}
	
	public List<Atividades> listarFunc() {
		return manager.createQuery("select distinct(a) from Atividades a join fetch a.func", 
				Atividades.class).getResultList();
	}
	
}
