package ec.gob.acess.esamyn.dao;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import ec.gob.acess.esamyn.modelo.Verificador;

/**
 * 
 * Interfaz VerificadorDAO para clase Verificador
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface VerificadorDAO extends GenericDao<Verificador, Long> {

	/**
	 * Elimina las verificaciones relaiconadas a un Evaluacion.
	 * 
	 * @param codigoEvaluacion
	 */
	void eliminarVerificadorPorEvaluacion(Long codigoEvaluacion);
}
