/**
 * 
 */
package ec.gob.acess.esamyn.bean;

import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.RespuestaDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.exception.EvaluacionException;
import ec.gob.acess.esamyn.modelo.EstablecimientoSalud;
import ec.gob.acess.esamyn.modelo.Evaluacion;
import ec.gob.acess.esamyn.modelo.Parametro;
import ec.gob.acess.esamyn.modelo.Respuesta;

/**
 * 
 * Clase: EvaluacionBean.java
 * 
 * @author Juan Ochoa
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class EvaluacionBean extends GenericServiceImpl<Evaluacion, Long> {

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

	@Override
	public GenericDao<Evaluacion, Long> getDao() {
		// TODO Auto-generated method stub
		return null;
	}
}
