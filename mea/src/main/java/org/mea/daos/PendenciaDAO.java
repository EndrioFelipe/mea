package org.mea.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.TiposPendencias;
import org.mea.models.UsuarioTemp;
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
	
	public void gravarUsuarioTemp(UsuarioTemp userTemp){
        manager.persist(userTemp);
    }
	
	public List<TiposPendencias> listar() {
		return manager.createQuery("select tp from TiposPendencias tp", 
				TiposPendencias.class).getResultList();
	}
	
	public List<TiposPendencias> listarChecados() {
		return manager.createQuery("select tp from TiposPendencias tp where tp.situacao=:naoChecado", 
				TiposPendencias.class).setParameter("naoChecado", true).getResultList();
	}
	
	public boolean atualizar(String codigo) {
		
		manager.createQuery("update TiposPendencias tp set tp.situacao=:stn where tp.codigoPendencia = :siape ")
		.setParameter("siape", codigo)
		.setParameter("stn", false)
		.executeUpdate();
		
		return manager.createQuery("select tp from TiposPendencias tp where tp.codigoPendencia = :siape ", 
				TiposPendencias.class).setParameter("siape", codigo).getSingleResult().isSituacao();		
	}
}	
