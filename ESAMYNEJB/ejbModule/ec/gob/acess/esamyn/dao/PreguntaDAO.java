package ec.gob.acess.esamyn.dao;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import ec.gob.acess.esamyn.modelo.Canton;
import ec.gob.acess.esamyn.modelo.Pregunta;

/**
 * 
 * Clase: PreguntaDAO.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface PreguntaDAO extends GenericDao<Pregunta, Long> {

}
