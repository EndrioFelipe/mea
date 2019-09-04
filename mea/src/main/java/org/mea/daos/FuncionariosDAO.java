package org.mea.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.RepFuncionarios;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class FuncionariosDAO {

	@PersistenceContext
    private EntityManager manager;
	
	public void gravar(RepFuncionarios repFuncionarios){
        manager.persist(repFuncionarios);
    }	
	
	public List<RepFuncionarios> listar() {
		return manager.createQuery("select f from RepFuncionarios f", 
				RepFuncionarios.class).getResultList();
	}
	
	
}
