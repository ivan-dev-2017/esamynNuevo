package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.VerificadorDAO;
import ec.gob.acess.esamyn.modelo.Verificador;

/**
 * 
 * Implementación de la Interfaz VerificadorDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class VerificadorDAOImpl extends GenericEmDaoEjb<Verificador, Long> implements VerificadorDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public VerificadorDAOImpl() {
		super(Verificador.class);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * ec.gob.acess.esamyn.dao.VerificadorDAO#eliminarVerificadorPorEvaluacion(java.
	 * lang.Long)
	 */
	@Override
	public void eliminarVerificadorPorEvaluacion(Long codigoEvaluacion) {
		StringBuffer hql = new StringBuffer(40);
		hql.append("delete Verificador v where v.evaluacion.codigo = :codigoEvaluacion");

		Query delete = em.createQuery(hql.toString());
		delete.setParameter("codigoEvaluacion", codigoEvaluacion);

		delete.executeUpdate();
	}

}
