package org.mea.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.Arquivo;
import org.mea.models.RepFuncionarios;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ArquivoDAO {
	@PersistenceContext
    private EntityManager manager;
	
	public void gravar(Arquivo arquivo){
        manager.persist(arquivo);
    }
	
	public List<Arquivo> listar () {
		return manager.createQuery("select distinct(a) from Arquivo a", 
				Arquivo.class).getResultList();
	}
	
}
