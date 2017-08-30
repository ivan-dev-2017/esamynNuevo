package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;
import ec.gob.acess.esamyn.dao.CatalogoDAO;
import ec.gob.acess.esamyn.modelo.Catalogo;

/**
 * 
 * Implementación de la Interfaz CatalogoDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class CatalogoDAOImpl extends GenericEmDaoEjb<Catalogo, Long> implements CatalogoDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public CatalogoDAOImpl() {
		super(Catalogo.class);
	}

}
