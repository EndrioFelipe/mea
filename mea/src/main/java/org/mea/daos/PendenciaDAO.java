package org.mea.daos;

import java.util.List;

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
	
	public List<TiposPendencias> listar() {
		return manager.createQuery("select tp from TiposPendencias tp", 
				TiposPendencias.class).getResultList();
	}
	
	public String atualizar() {
		
		manager.createQuery("update TiposPendencias tp set tp.nomeRquisitante=:nome where tp.codigoPendencia = :siape ")
		.setParameter("siape", "1038485")
		.setParameter("nome", "Gervásio")
		.executeUpdate();
		
		return manager.createQuery("select tp from TiposPendencias tp where tp.codigoPendencia = :siape ", 
				TiposPendencias.class).setParameter("siape", "1038485").getSingleResult().getNomeRquisitante();
		

	}
}	
