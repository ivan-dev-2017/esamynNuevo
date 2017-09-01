package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;
import ec.gob.acess.esamyn.dao.EvaluacionDAO;
import ec.gob.acess.esamyn.modelo.Evaluacion;

/**
 * 
 * Implementación de la Interfaz EvaluacionDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class EvaluacionDAOImpl extends GenericEmDaoEjb<Evaluacion, Long> implements EvaluacionDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public EvaluacionDAOImpl() {
		super(Evaluacion.class);
	}

}
