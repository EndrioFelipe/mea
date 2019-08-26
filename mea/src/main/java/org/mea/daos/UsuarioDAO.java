package org.mea.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.UsrRep;
import org.mea.models.UsuarioF;
import org.mea.models.UsuarioTemp;
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
	
	public UsrRep findUserRep(String siape) {
		return manager.createQuery("select distinct(u) from UsrRep u where u.siape = :siape", 
				UsrRep.class).setParameter("siape", siape).getSingleResult();
	}
	
	public UsuarioTemp findUsuarioTemp(String siape) {
		return manager.createQuery("select distinct(u) from UsuarioTemp u where u.siape = :siape", 
				UsuarioTemp.class).setParameter("siape", siape).getSingleResult();
	}
	

}
