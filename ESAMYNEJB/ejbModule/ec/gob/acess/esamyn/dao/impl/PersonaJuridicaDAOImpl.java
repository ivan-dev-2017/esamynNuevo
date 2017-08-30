package ec.gob.acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;
import ec.gob.acess.esamyn.dao.PersonaJuridicaDAO;
import ec.gob.acess.esamyn.modelo.PersonaJuridica;

/**
 * 
 * Implementación de la Interfaz PersonaJuridicaDAO
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Stateless
public class PersonaJuridicaDAOImpl extends GenericEmDaoEjb<PersonaJuridica, Long> implements PersonaJuridicaDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public PersonaJuridicaDAOImpl() {
		super(PersonaJuridica.class);
	}

}
