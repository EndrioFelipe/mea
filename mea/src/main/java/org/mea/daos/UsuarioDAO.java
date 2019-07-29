package org.mea.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mea.models.UsuarioF;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO implements UserDetailsService{

    @PersistenceContext
    private EntityManager manager;
    

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		List<UsuarioF> usuarios = manager.createQuery("select u from UsuarioF u where u.userName = :userName", UsuarioF.class)
                .setParameter("userName", userName).getResultList();

        if (usuarios.isEmpty()) {
            throw new UsernameNotFoundException("O usuário " + userName + " não foi encontrado");
        }

        return usuarios.get(0);
    }
	

}
