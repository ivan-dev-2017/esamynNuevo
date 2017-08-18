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

import acess.esamyn.dao.ParametroDAO;
import acess.esamyn.modelo.Parametro;

/**
 * @author Duval
 * 
 */
@Stateless
public class ParametroDAOImpl extends GenericEmDaoEjb<Parametro, Long> implements
		ParametroDAO {

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
