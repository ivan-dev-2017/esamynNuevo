package ec.gob.acess.esamyn.dao;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import ec.gob.acess.esamyn.modelo.TipoPregunta;

/**
 * 
 * Clase: TipoPreguntaDAO.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface TipoPreguntaDAO extends GenericDao<TipoPregunta, Long> {
	
}
