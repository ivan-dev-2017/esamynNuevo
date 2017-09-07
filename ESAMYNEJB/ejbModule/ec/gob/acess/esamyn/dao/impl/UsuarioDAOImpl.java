package ec.gob.acess.esamyn.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.UsuarioDAO;
import ec.gob.acess.esamyn.modelo.Usuario;

/**
 * 
 * Implementación de la Interfaz UsuarioDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class UsuarioDAOImpl extends GenericEmDaoEjb<Usuario, Long> implements UsuarioDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public UsuarioDAOImpl() {
		super(Usuario.class);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see ec.gob.acess.esamyn.dao.UsuarioDAO#getPorUsername(java.lang.String)
	 */
	@Override
	public Usuario getPorUsername(String username) {
		StringBuffer hql = new StringBuffer(50);
		hql.append("select u from Usuario u ");
		hql.append("where u.username = :username");

		Query query = em.createQuery(hql.toString());
		query.setParameter("username", username);

		List<Usuario> usuarioLista = query.getResultList();

		Usuario usuario = null;

		if (usuarioLista != null && !usuarioLista.isEmpty()) {
			usuario = usuarioLista.get(0);
		}

		return usuario;
	}

}
