package org.mea.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ArquivoDAO {
	@PersistenceContext
    private EntityManager manager;
	
	
}
