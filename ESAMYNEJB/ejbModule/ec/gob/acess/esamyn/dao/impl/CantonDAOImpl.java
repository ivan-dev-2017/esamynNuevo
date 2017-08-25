package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.CantonDAO;
import ec.gob.acess.esamyn.modelo.Canton;

/**
 * @author Duval
 * 
 */
@Stateless
public class CantonDAOImpl extends GenericEmDaoEjb<Canton, Long> implements
		CantonDAO {

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
