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

import acess.esamyn.dao.TipoGrupoParametroDAO;
import acess.esamyn.modelo.TipoGrupoParametro;

/**
 * @author Duval
 * 
 */
@Stateless
public class TipoGrupoParametroDAOImpl extends GenericEmDaoEjb<TipoGrupoParametro, Long> implements
		TipoGrupoParametroDAO {

	@PersistenceContext(unitName = "esamyn-pu")
	private EntityManager em;

	@Override
	protected EntityManager getEm() {
		return em;
	}

	public TipoGrupoParametroDAOImpl() {
		super(TipoGrupoParametro.class);
	}

}
