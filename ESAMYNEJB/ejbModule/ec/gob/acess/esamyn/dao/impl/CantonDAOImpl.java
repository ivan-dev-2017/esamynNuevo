package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;
import ec.gob.acess.esamyn.dao.CantonDAO;
import ec.gob.acess.esamyn.modelo.Canton;

/**
 * 
 * Implementación de la Interfaz CantonDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class CantonDAOImpl extends GenericEmDaoEjb<Canton, Long> implements CantonDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public CantonDAOImpl() {
		super(Canton.class);
	}

}
