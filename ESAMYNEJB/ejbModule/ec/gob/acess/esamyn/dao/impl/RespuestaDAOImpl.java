package ec.gob.acess.esamyn.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.RespuestaDAO;
import ec.gob.acess.esamyn.modelo.Respuesta;

/**
 * 
 * Implementación de la Interfaz RespuestaDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class RespuestaDAOImpl extends GenericEmDaoEjb<Respuesta, Long> implements RespuestaDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public RespuestaDAOImpl() {
		super(Respuesta.class);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * ec.gob.acess.esamyn.dao.RespuestaDAO#getRespuestasParaEvaluar(java.lang.Long,
	 * java.util.List, java.lang.Integer)
	 */
	@Override
	public List<Respuesta> getRespuestasParaEvaluar(Long codigoEstablecimientoSalud, List<Long> codigoPreguntaList,
			Integer anio) {
		StringBuffer hql = new StringBuffer(200);
		hql.append("select r from Respuesta r inner join r.pregunta p ");
		hql.append("where r.encuesta.establecimientoSalud.codigo = :codigoEstablecimientoSalud ");
		hql.append("and p.codigo in (:codigosPreguntas) ");
		hql.append("and year(r.encuesta.fechaInicial) = :anio ");
		hql.append("and r.encuesta.finalizada = 1 ");

		Query query = em.createQuery(hql.toString());
		query.setParameter("codigoEstablecimientoSalud", codigoEstablecimientoSalud);
		query.setParameter("codigosPreguntas", codigoPreguntaList);
		query.setParameter("anio", anio);

		return query.getResultList();
	}

}
