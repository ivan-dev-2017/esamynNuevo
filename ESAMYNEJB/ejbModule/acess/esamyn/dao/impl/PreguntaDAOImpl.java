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

import acess.esamyn.dao.PreguntaDAO;
import acess.esamyn.modelo.Pregunta;

/**
 * @author Duval
 * 
 */
@Stateless
public class PreguntaDAOImpl extends GenericEmDaoEjb<Pregunta, Long> implements
		PreguntaDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public PreguntaDAOImpl() {
		super(Pregunta.class);
	}

}
