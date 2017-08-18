/**
 * 
 */
package acess.esamyn.bean;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import acess.esamyn.dao.RespuestaDAO;
import acess.esamyn.dto.MensajeDto;
import acess.esamyn.exception.EvaluacionException;
import acess.esamyn.modelo.Parametro;
import acess.esamyn.modelo.Respuesta;

/**
 * Clase que permite manejar la logica sobre las Evaluaciones.
 * 
 * @author juan
 *
 */
@Stateless
@LocalBean
public class EvaluacionBean {

	@EJB
	private RespuestaDAO respuestaDAO;

	/**
	 * Crea la evaluación de un establecimiento de salud.
	 * 
	 * @param codigoEstablecimientoSalud
	 * @return
	 */
	public MensajeDto crearEvaluacion(Long codigoEstablecimientoSalud) throws EvaluacionException {
		MensajeDto resp = null;

		// 1. Se obtienen todos los parametros a ser evaluados.
		List<Parametro> parametroList = null;

		// 2. Se recorre cada uno de los parametros y se arma la evaluacion
		// corespondiente
		for (Parametro param : parametroList) {
			// 3. Se obtienen todas las respuestas que se evaluan por el parametro del
			// establecimiento a valuar
			List<Respuesta> respuestaList = respuestaDAO.getRespuestasParaEvaluar(codigoEstablecimientoSalud,
					param.getParId());

			if (respuestaList != null && !respuestaList.isEmpty()) {

			}
		}

		return resp;
	}
}
