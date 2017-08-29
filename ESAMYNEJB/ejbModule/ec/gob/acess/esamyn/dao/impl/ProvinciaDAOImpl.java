package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.ProvinciaDAO;
import ec.gob.acess.esamyn.modelo.Provincia;

/**
 * @author Duval
 * 
 */
@Stateless
public class ProvinciaDAOImpl extends GenericEmDaoEjb<Provincia, Long> implements
		ProvinciaDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public ProvinciaDAOImpl() {
		super(Provincia.class);
	}

}
