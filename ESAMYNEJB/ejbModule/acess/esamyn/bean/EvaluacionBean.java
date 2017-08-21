/**
 * 
 */
package acess.esamyn.bean;

import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import acess.esamyn.dao.RespuestaDAO;
import acess.esamyn.dto.MensajeDto;
import acess.esamyn.exception.EvaluacionException;
import acess.esamyn.modelo.EstablecimientoSalud;
import acess.esamyn.modelo.Evaluacion;
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
	public void crearEvaluacion(Long codigoEstablecimientoSalud, String usuario) throws EvaluacionException {
		MensajeDto resp = null;

		EstablecimientoSalud establecimiento = new EstablecimientoSalud(codigoEstablecimientoSalud);

		// 0. Se crea el objeto evaluacion
		Evaluacion evaluacion = new Evaluacion();
		evaluacion.setCreado(new Date());
		evaluacion.setCreadoPor(usuario);
		evaluacion.setEstablecimientoSalud(establecimiento);
		evaluacion.setFechaInicio(new Date());

		// TODO: Obtener el codigo de alguna manera

		// 1. Se obtienen todos los parametros a ser evaluados.
		List<Parametro> parametroList = null;

		// 2. Se recorre cada uno de los parametros y se arma la evaluacion
		// corespondiente
		for (Parametro param : parametroList) {
			// 3. Se obtienen todas las respuestas que se evaluan por el parametro del
			// establecimiento a valuar
			List<Respuesta> respuestaList = respuestaDAO.getRespuestasParaEvaluar(codigoEstablecimientoSalud,
					param.getCodigo());

			if (respuestaList != null && !respuestaList.isEmpty()) {

			}
		}

		// 4. Actualizar las encuestas con el ID de la evaluacion que se crea

	}
}
