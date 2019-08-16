package org.mea.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.TiposPendencias;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class PendenciaDAO {
	
	@PersistenceContext
    private EntityManager manager;
	
	public void gravar(TiposPendencias pendencia){
        manager.persist(pendencia);
    }		
}	
