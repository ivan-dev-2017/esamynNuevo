package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.CumpleCondicionNoAplicaDAO;
import ec.gob.acess.esamyn.modelo.CumpleCondicionNoAplica;

/**
 * 
 * Implementacion de CumpleCondicionNoAplicaDAO para acceso a datos de clase CumpleCondicionNoAplica
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class CumpleCondicionNoAplicaDAOImpl extends GenericEmDaoEjb<CumpleCondicionNoAplica, Long> implements
CumpleCondicionNoAplicaDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public CumpleCondicionNoAplicaDAOImpl() {
		super(CumpleCondicionNoAplica.class);
	}

}
