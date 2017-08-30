package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.CondicionDAO;
import ec.gob.acess.esamyn.modelo.CondicionNoAplica;

/**
 * @author Duval
 * 
 */
@Stateless
public class CondicionDAOImpl extends GenericEmDaoEjb<CondicionNoAplica, Long> implements
		CondicionDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public CondicionDAOImpl() {
		super(CondicionNoAplica.class);
	}

}
