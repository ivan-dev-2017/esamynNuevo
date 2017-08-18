/* 
 * DiaFestivoDaoImpl.java
 * 03/06/2016 
 * Copyright 2016 Saviasoft Cia. Ltda. 
 */
package acess.esamyn.dao.impl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.saviasoft.persistence.util.dao.ejb.GenericEmDaoEjb;

import acess.esamyn.dao.PersonaJuridicaDAO;
import acess.esamyn.modelo.PersonaJuridica;

/**
 * @author Duval
 * 
 */
@Stateless
public class PersonaJuridicaDAOImpl extends GenericEmDaoEjb<PersonaJuridica, Long> implements
		PersonaJuridicaDAO {

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
