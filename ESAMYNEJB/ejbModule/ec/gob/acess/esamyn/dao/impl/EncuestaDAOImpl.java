package ec.gob.acess.esamyn.dao.impl;

import java.util.Set;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.EncuestaDAO;
import ec.gob.acess.esamyn.modelo.Encuesta;

/**
 * 
 * Implementación de la Interfaz EncuestaDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class EncuestaDAOImpl extends GenericEmDaoEjb<Encuesta, Long> implements EncuestaDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public EncuestaDAOImpl() {
		super(Encuesta.class);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * ec.gob.acess.esamyn.dao.EncuestaDAO#actualizarEncuestaEvaluacion(java.util.
	 * Set, java.lang.Long)
	 */
	@Override
	public void actualizarEncuestaEvaluacion(Set<Long> encuestaCodigoSet, Long codigoEvaluacion) {
		StringBuffer hql = new StringBuffer(50);
		hql.append("update esa_encuesta set enc_evaluacion = :codigoEvaluacion where enc_id in (:encuestaCodigos)");

		Query update = em.createNativeQuery(hql.toString());
		update.setParameter("codigoEvaluacion", codigoEvaluacion);
		update.setParameter("encuestaCodigos", encuestaCodigoSet);

		update.executeUpdate();
	}

}
