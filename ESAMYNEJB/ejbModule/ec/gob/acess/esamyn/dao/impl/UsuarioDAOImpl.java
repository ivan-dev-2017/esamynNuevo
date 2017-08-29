package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.UsuarioDAO;
import ec.gob.acess.esamyn.modelo.Usuario;

/**
 * @author Duval
 * 
 */
@Stateless
public class UsuarioDAOImpl extends GenericEmDaoEjb<Usuario, Long> implements
		UsuarioDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public UsuarioDAOImpl() {
		super(Usuario.class);
	}

}
