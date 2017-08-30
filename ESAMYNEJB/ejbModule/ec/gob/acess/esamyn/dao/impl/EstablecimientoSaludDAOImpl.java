package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;
import ec.gob.acess.esamyn.dao.EstablecimientoSaludDAO;
import ec.gob.acess.esamyn.modelo.EstablecimientoSalud;

/**
 * 
 * Implementación de la Interfaz EstablecimientoSaludDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class EstablecimientoSaludDAOImpl extends GenericEmDaoEjb<EstablecimientoSalud, Long>
		implements EstablecimientoSaludDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public EstablecimientoSaludDAOImpl() {
		super(EstablecimientoSalud.class);
	}

}
