package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;
import ec.gob.acess.esamyn.dao.ParametroDAO;
import ec.gob.acess.esamyn.modelo.Parametro;

/**
 * 
 * Implementación de la Interfaz ParametroDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class ParametroDAOImpl extends GenericEmDaoEjb<Parametro, Long> implements ParametroDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public ParametroDAOImpl() {
		super(Parametro.class);
	}

}
