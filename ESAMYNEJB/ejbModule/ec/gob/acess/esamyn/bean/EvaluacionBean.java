/**
 * 
 */
package ec.gob.acess.esamyn.bean;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.dao.EvaluacionDAO;
import ec.gob.acess.esamyn.dao.ParametroDAO;
import ec.gob.acess.esamyn.dao.RespuestaDAO;
import ec.gob.acess.esamyn.dao.UsuarioDAO;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.exception.EvaluacionException;
import ec.gob.acess.esamyn.modelo.EstablecimientoSalud;
import ec.gob.acess.esamyn.modelo.Evaluacion;
import ec.gob.acess.esamyn.modelo.Parametro;
import ec.gob.acess.esamyn.modelo.Respuesta;
import ec.gob.acess.esamyn.modelo.Usuario;

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
	private EvaluacionDAO evaluacionDAO;

	@EJB
	private RespuestaDAO respuestaDAO;

	@EJB
	private UsuarioDAO usuarioDAO;

	@EJB
	private ParametroDAO parametroDAO;

	/**
	 * Crea la evaluación de un establecimiento de salud.
	 * 
	 * @param codigoEstablecimientoSalud
	 * @return
	 */
	public void crearEvaluacion(Long codigoEstablecimientoSalud, String username) throws EvaluacionException {
		MensajeDto resp = null;

		EstablecimientoSalud establecimiento = new EstablecimientoSalud(codigoEstablecimientoSalud);
		Usuario usuario = usuarioDAO.getPorUsername(username);

		Calendar ahora = Calendar.getInstance();
		int anioActual = ahora.get(Calendar.YEAR);

		// Se consulta si existe la evaluación para el anio en curso.
		Evaluacion evaluacion = evaluacionDAO.getPorEstablecimientoAnio(codigoEstablecimientoSalud, anioActual);

		// 1. Si no existe una evaluación para el anio actual, se debe crear una.
		if (evaluacion == null) {
			evaluacion = new Evaluacion();
			evaluacion.setEstablecimientoSalud(establecimiento);
			evaluacion.setFechaInicio(new Date());
			evaluacion.setUsuario(usuario);
		}

		// 1. Se obtienen todos los parametros a ser evaluados.
		List<Parametro> parametroList = parametroDAO.getParametrosParaEvaluacion();

		// 2. Se recorre cada uno de los parametros y se arma la evaluacion
		// corespondiente
		for (Parametro param : parametroList) {
			// 3. ParametroPregunta, son las preguntas con las cuales se debe evaluar un
			// parametro
			List<Long> codigoPreguntaList = param.getCodigoPreguntaList();

			if (codigoPreguntaList != null && !codigoPreguntaList.isEmpty()) {
				// 4. Se obtiene todas las respuestas de una pregunta dada una institucion.
				List<Respuesta> respuestaLista = respuestaDAO.getRespuestasParaEvaluar(codigoEstablecimientoSalud,
						codigoPreguntaList, anioActual);

				// TODO: Aqui me quedo
				if (respuestaLista != null && !respuestaLista.isEmpty()) {
					// Se evalua cada respuesta
				} else {
					// No hay respuestas para evaluar
				}
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
