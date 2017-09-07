package ec.gob.acess.esamyn.dao;

import java.util.List;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import ec.gob.acess.esamyn.modelo.Parametro;

/**
 * 
 * Interfaz ParametroDAO para clase Parametro
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface ParametroDAO extends GenericDao<Parametro, Long> {

	/**
	 * Obtiene todos los parametros involucrados en una evaluacion.
	 * 
	 * @return
	 */
	List<Parametro> getParametrosParaEvaluacion();
}
