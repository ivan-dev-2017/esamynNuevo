package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.GrupoParametroDAO;
import ec.gob.acess.esamyn.modelo.GrupoParametro;

/**
 * @author Duval
 * 
 */
@Stateless
public class GrupoParametroDAOImpl extends GenericEmDaoEjb<GrupoParametro, Long> implements
		GrupoParametroDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public GrupoParametroDAOImpl() {
		super(GrupoParametro.class);
	}

}
