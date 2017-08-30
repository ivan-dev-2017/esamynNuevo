package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;
import ec.gob.acess.esamyn.dao.RolDAO;
import ec.gob.acess.esamyn.modelo.Rol;

/**
 * 
 * Implementación de la Interfaz RolDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class RolDAOImpl extends GenericEmDaoEjb<Rol, Long> implements RolDAO {

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
