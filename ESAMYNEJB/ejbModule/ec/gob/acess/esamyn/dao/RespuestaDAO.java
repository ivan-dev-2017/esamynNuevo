package ec.gob.acess.esamyn.dao;

import java.util.List;

import javax.ejb.Local;

import com.saviasoft.persistence.util.dao.GenericDao;

import ec.gob.acess.esamyn.modelo.Respuesta;

/**
 * 
 * Interfaz RespuestaDAO para clase Respuesta
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Local
public interface RespuestaDAO extends GenericDao<Respuesta, Long> {
	/**
	 * Obtiene el listado de respuestas relacionadas a un establecimiento de salud y
	 * a un listado de preguntas.
	 * 
	 * @param codigoEstablecimientoSalud
	 * @param codigoPreguntaList
	 * @param anio
	 * @return
	 */
	List<Respuesta> getRespuestasParaEvaluar(Long codigoEstablecimientoSalud, List<Long> codigoPreguntaList,
			Integer anio);
}
