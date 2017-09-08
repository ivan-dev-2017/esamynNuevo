package ec.gob.acess.esamyn.dao;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import ec.gob.acess.esamyn.modelo.Evaluacion;

/**
 * 
 * Interfaz EvaluacionDAO para clase Evaluacion
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface EvaluacionDAO extends GenericDao<Evaluacion, Long> {

	/**
	 * Obtiene la Evaluación de un establecimiento de un anio.
	 * 
	 * @param codigoEstablecimientoSalud
	 * @param anio
	 * @return
	 */
	Evaluacion getPorEstablecimientoAnio(Long codigoEstablecimientoSalud, Integer anio);
}
