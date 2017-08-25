package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.TipoPreguntaDAO;
import ec.gob.acess.esamyn.modelo.TipoPregunta;

/**
 * @author Duval
 * 
 */
@Stateless
public class TipoPreguntaDAOImpl extends GenericEmDaoEjb<TipoPregunta, Long> implements
		TipoPreguntaDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public TipoPreguntaDAOImpl() {
		super(TipoPregunta.class);
	}

}
