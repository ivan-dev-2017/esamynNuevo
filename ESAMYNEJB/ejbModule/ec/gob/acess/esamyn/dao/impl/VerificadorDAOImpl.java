package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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

}
