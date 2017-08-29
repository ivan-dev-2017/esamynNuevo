package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import ec.gob.acess.esamyn.dao.FormularioDAO;
import ec.gob.acess.esamyn.modelo.Formulario;

/**
 * @author Duval
 * 
 */
@Stateless
public class FormularioDAOImpl extends GenericEmDaoEjb<Formulario, Long> implements
		FormularioDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public FormularioDAOImpl() {
		super(Formulario.class);
	}

}
