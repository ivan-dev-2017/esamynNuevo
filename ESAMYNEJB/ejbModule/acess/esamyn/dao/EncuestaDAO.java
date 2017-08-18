/* 
 * ActividadDao.java
 * 03/06/2016 
 * Copyright 2009 Saviasoft Cia. Ltda. 
 */
package acess.esamyn.dao;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import acess.esamyn.modelo.Encuesta;

/**
 * @author Duval
 * 
 */
@Local
public interface EncuestaDAO extends GenericDao<Encuesta, Long> {
	
}

