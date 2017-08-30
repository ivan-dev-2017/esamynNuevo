package ec.gob.acess.esamyn.dao.impl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
	 * @see acess.esamyn.dao.RespuestaDAO#getRespuestasParaEvaluar(java.lang.Long,
	 * java.lang.Long)
	 */
	@Override
	public List<Respuesta> getRespuestasParaEvaluar(Long codigoEstablecimientoSalud, Long codigoParametro) {
		StringBuffer hql = new StringBuffer(200);
		hql.append("select r from Respuesta r ");

		return null;
	}

}
