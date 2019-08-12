package org.mea.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.Atividades;
import org.mea.models.UsuarioF;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO implements UserDetailsService{

    @PersistenceContext
    private EntityManager manager;
    
    public List<UsuarioF> listar() {
		return manager.createQuery("select distinct(u) from UsuarioF u", 
				UsuarioF.class).getResultList();
	}
    
    public void gravarUsuarioTemp(Atividades atividade){
        manager.persist(atividade);
    }
    
    
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		List<UsuarioF> usuarios = manager.createQuery("select u from UsuarioF u where u.userName = :userName", UsuarioF.class)
                .setParameter("userName", userName).getResultList();

        if (usuarios.isEmpty()) {
            throw new UsernameNotFoundException("O usuário " + userName + " não foi encontrado");
        }

        return usuarios.get(0);
    }
	
	public UsuarioF find(String userName) {
		
		return manager.createQuery("select distinct(u) from UsuarioF u where u.userName = :userName", 
				UsuarioF.class).setParameter("userName", userName).getSingleResult();
	}
	

}
