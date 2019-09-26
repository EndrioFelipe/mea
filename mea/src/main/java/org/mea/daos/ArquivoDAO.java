package org.mea.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.Arquivo;
import org.mea.models.Pasta;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ArquivoDAO {
	@PersistenceContext
	private EntityManager manager;

	public void gravar(Arquivo arquivo) {
		manager.persist(arquivo);
	}
	
	 public Arquivo findOne(Integer id) {
	        return manager.find(Arquivo.class, id);
	}
	
	public List<Arquivo> deletar(Integer id) {
		manager.remove(findOne(id));
		return listar();
	}
	
	public List<Arquivo> listar() {
		return manager.createQuery("select distinct(a) from Arquivo a join fetch a.pasta ", Arquivo.class)
				.getResultList();
	}

	
	public List<Pasta> listarPastas () { 
		return manager.createQuery("select distinct(p) from Pasta p ",Pasta.class)
				.getResultList(); 
		}
	 
	

}
