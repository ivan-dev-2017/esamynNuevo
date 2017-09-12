
package ec.gob.acess.esamyn.dao;

import java.util.Set;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import ec.gob.acess.esamyn.modelo.Encuesta;

/**
 * 
 * Interfaz EncuestaDAO para clase Encuesta
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface EncuestaDAO extends GenericDao<Encuesta, Long> {
	/**
	 * Se actualiza las encuestas con el codigo de evaluacion enviado.
	 * 
	 * @param encuestaCodigoSet
	 * @param codigoEvaluacion
	 */
	void actualizarEncuestaEvaluacion(Set<Long> encuestaCodigoSet, Long codigoEvaluacion);
}
