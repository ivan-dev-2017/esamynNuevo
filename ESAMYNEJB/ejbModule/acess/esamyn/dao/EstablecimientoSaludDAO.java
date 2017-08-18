/* 
 * ActividadDao.java
 * 03/06/2016 
 * Copyright 2009 Saviasoft Cia. Ltda. 
 */
package acess.esamyn.dao;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import acess.esamyn.modelo.EstablecimientoSalud;

/**
 * @author Duval
 * 
 */
@Local
public interface EstablecimientoSaludDAO extends GenericDao<EstablecimientoSalud , Long> {
	
}

