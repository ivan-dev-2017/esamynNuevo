package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.VerificadorDAO;
import ec.gob.acess.esamyn.modelo.Verificador;

/**
 * @author Duval
 * 
 */
@Stateless
public class VerificadorDAOImpl extends GenericEmDaoEjb<Verificador, Long> implements
		VerificadorDAO {

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
