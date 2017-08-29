package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.RolDAO;
import ec.gob.acess.esamyn.modelo.Rol;

/**
 * @author Duval
 * 
 */
@Stateless
public class RolDAOImpl extends GenericEmDaoEjb<Rol, Long> implements
		RolDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public RolDAOImpl() {
		super(Rol.class);
	}

}
