package ec.gob.acess.esamyn.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * ec.gob.acess.esamyn.dao.EvaluacionDAO#getPorEstablecimientoAnio(java.lang.
	 * Long, java.lang.Integer)
	 */
	@Override
	public Evaluacion getPorEstablecimientoAnio(Long codigoEstablecimientoSalud, Integer anio) {
		StringBuffer hql = new StringBuffer(100);
		hql.append("select e from Evaluacion e ");
		hql.append("where e.establecimientoSalud.codigo = :codigoEstablecimientoSalud ");
		hql.append("and year(e.fechaInicio) = :anio ");

		Query query = em.createQuery(hql.toString());
		query.setParameter("codigoEstablecimientoSalud", codigoEstablecimientoSalud);
		query.setParameter("anio", anio);

		List<Evaluacion> evaluacionLista = query.getResultList();

		Evaluacion evaluacion = null;

		if (evaluacionLista != null && !evaluacionLista.isEmpty()) {
			evaluacion = evaluacionLista.get(0);
		}

		return evaluacion;
	}

}
