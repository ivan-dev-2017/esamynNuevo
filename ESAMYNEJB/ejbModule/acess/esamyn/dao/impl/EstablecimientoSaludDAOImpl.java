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

import acess.esamyn.dao.EstablecimientoSaludDAO;
import acess.esamyn.modelo.EstablecimientoSalud;

/**
 * @author Duval
 * 
 */
@Stateless
public class EstablecimientoSaludDAOImpl extends GenericEmDaoEjb<EstablecimientoSalud, Long> implements
		EstablecimientoSaludDAO {

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
