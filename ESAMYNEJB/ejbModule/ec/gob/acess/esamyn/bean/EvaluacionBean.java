/**
 * 
 */
package ec.gob.acess.esamyn.bean;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;

import ec.gob.acess.esamyn.constante.TipoPreguntaEnum;
import ec.gob.acess.esamyn.dao.EncuestaDAO;
import ec.gob.acess.esamyn.dao.EvaluacionDAO;
import ec.gob.acess.esamyn.dao.ParametroDAO;
import ec.gob.acess.esamyn.dao.RespuestaDAO;
import ec.gob.acess.esamyn.dao.UsuarioDAO;
import ec.gob.acess.esamyn.dao.VerificadorDAO;
import ec.gob.acess.esamyn.exception.EvaluacionException;
import ec.gob.acess.esamyn.modelo.EstablecimientoSalud;
import ec.gob.acess.esamyn.modelo.Evaluacion;
import ec.gob.acess.esamyn.modelo.Parametro;
import ec.gob.acess.esamyn.modelo.Respuesta;
import ec.gob.acess.esamyn.modelo.Usuario;
import ec.gob.acess.esamyn.modelo.Verificador;

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

	@EJB
	private VerificadorDAO verificadorDAO;

	@EJB
	private EncuestaDAO encuestaDAO;

	/**
	 * Crea la evaluación de un establecimiento de salud.
	 * 
	 * @param codigoEstablecimientoSalud
	 * @return
	 */
	public void crearEvaluacion(Long codigoEstablecimientoSalud, String username) throws EvaluacionException {
		EstablecimientoSalud establecimiento = new EstablecimientoSalud(codigoEstablecimientoSalud);
		Usuario usuario = usuarioDAO.getPorUsername(username);

		Calendar ahora = Calendar.getInstance();
		int anioActual = ahora.get(Calendar.YEAR);

		// 1. Se consulta si existe la evaluación para el anio en curso.
		Evaluacion evaluacion = evaluacionDAO.getPorEstablecimientoAnio(codigoEstablecimientoSalud, anioActual);

		// 2. Si no existe una evaluación para el anio actual, se debe crear una.
		if (evaluacion == null) {
			evaluacion = new Evaluacion();
			evaluacion.setEstablecimientoSalud(establecimiento);
			evaluacion.setFechaInicio(ahora.getTime());
			evaluacion.setUsuario(usuario);
		}
		evaluacion.setFechaCalificacion(ahora.getTime());

		// 3. Se obtienen todos los parametros a ser evaluados.
		List<Parametro> parametroList = parametroDAO.getParametrosParaEvaluacion();

		// 4. Los verificadores de Evaluacion que se van a crear
		List<Verificador> verificadorLista = new ArrayList<Verificador>();

		// 5. Se define Set con codigos de encuestas
		Set<Long> codigoEncuestaSet = new HashSet<Long>();

		// 6. Se recorre cada uno de los parametros y se arma la evaluacion
		// corespondiente
		for (Parametro parametro : parametroList) {
			// 7. ParametroPregunta, son las preguntas con las cuales se debe evaluar un
			// parametro
			List<Long> codigoPreguntaList = parametro.getCodigoPreguntaList();

			if (codigoPreguntaList != null && !codigoPreguntaList.isEmpty()) {
				// 8. Se obtiene todas las respuestas de una pregunta dada una institucion.
				List<Respuesta> respuestaLista = respuestaDAO.getRespuestasParaEvaluar(codigoEstablecimientoSalud,
						codigoPreguntaList, anioActual);

				if (respuestaLista != null && !respuestaLista.isEmpty()) {

					// 9. Se cargan los codigos de las encuestas que luego van a ser alterados con
					// el id de la evaluacion
					cargarCodigosEncuesta(codigoEncuestaSet, respuestaLista);

					// 10. Se cuentan respuestas por preguntas
					Map<Long, Integer> respuestasPorPreguntaMap = contarRespuestasDePreguntas(codigoPreguntaList,
							respuestaLista);

					// 11. Se verifica que exista el numero de respuestas requeridas
					boolean isUmbralCompleto = verificarRespuestasDisponibles(parametro.getUmbral(), codigoPreguntaList,
							respuestasPorPreguntaMap);

					// 12. Se evalua el parametro
					evaluarUnParametro(evaluacion, parametro, respuestaLista, isUmbralCompleto, parametro,
							respuestasPorPreguntaMap, verificadorLista);
				} else {
					// No hay respuestas para evaluar
				}
			}
		}

		// 13. Se pone el numero de encuestas evaluadas
		evaluacion.setCantidadEncuestas(codigoEncuestaSet.size());

		// 14. Persitir Evaluacion y verificadores
		persistirInformacion(evaluacion, verificadorLista);

		// 15. Actualizar las encuestas con el ID de la evaluacion que se crea
		actualizarEncuesta(codigoEncuestaSet, evaluacion);
	}

	/**
	 * Se actualizan las encuestas con el código de la evaluacion.
	 * 
	 * @param codigoEncuestaSet
	 * @param evaluacion
	 */
	private void actualizarEncuesta(Set<Long> codigoEncuestaSet, Evaluacion evaluacion) {
		encuestaDAO.actualizarEncuestaEvaluacion(codigoEncuestaSet, evaluacion.getCodigo());
	}

	/**
	 * Se cargan codigos de encuesta una sola vez en el Set para luego ser
	 * actualizadas.
	 * 
	 * @param codigoEncuestaSet
	 * @param respuestaLista
	 */
	private void cargarCodigosEncuesta(Set<Long> codigoEncuestaSet, List<Respuesta> respuestaLista) {
		for (Respuesta respuesta : respuestaLista) {
			codigoEncuestaSet.add(respuesta.getEncuesta().getCodigo());
		}
	}

	/**
	 * Actualizar o persistir Evaluacion.
	 * 
	 * @param evaluacion
	 * @param verificadorLista
	 */
	private void persistirInformacion(Evaluacion evaluacion, List<Verificador> verificadorLista) {
		// 0. Se obtiene el puntaje de la evualuacion
		BigInteger puntajeEvaluacion = obtenerPuntajeEvaluacion(verificadorLista);
		evaluacion.setCalificacion(puntajeEvaluacion);

		// 1. Se persiste o Actualiza Evaluacion de ser necesario
		if (evaluacion.getCodigo() == null) {
			evaluacionDAO.save(evaluacion);
		} else {
			evaluacionDAO.update(evaluacion);
		}

		// 2. Se borran las verificaciones actuales
		if (evaluacion.getCodigo() != null) {
			verificadorDAO.eliminarVerificadorPorEvaluacion(evaluacion.getCodigo());
		}

		// 3. Se persisten las evaluacioes nuevas
		for (Verificador verificador : verificadorLista) {
			verificadorDAO.save(verificador);
		}
	}

	/**
	 * Se obtiene el puntaje de la evaluacion.
	 * 
	 * @param verificadorLista
	 * @return
	 */
	private BigInteger obtenerPuntajeEvaluacion(List<Verificador> verificadorLista) {
		BigInteger puntaje = BigInteger.ZERO;

		for (Verificador verificador : verificadorLista) {
			if (1 == verificador.getCumple()) {
				puntaje = puntaje.add(BigInteger.valueOf(verificador.getParametro().getPuntaje().intValue()));
			}
		}

		return puntaje;
	}

	/**
	 * TODO: Aqui me quedo Realiza el proceso de evaluacion de un parametro.
	 * 
	 * En la Respuesta se considera con valor si al menos uno de los campos lo tiene
	 * caso contrario se considera como no respondida.
	 * 
	 * @param param
	 * @param respuestaLista
	 */
	private void evaluarUnParametro(Evaluacion evaluacion, Parametro param, List<Respuesta> respuestaLista,
			boolean cumpleConUmbral, Parametro parametro, Map<Long, Integer> respuestasPorPreguntaMap,
			List<Verificador> verificadorLista) {
		// 1. Se obtiene la menor cantidad de evaluaciones
		int cantidadMedidas = Collections.min(respuestasPorPreguntaMap.values());

		// 2. Se obtiene cuantas preguntas se han resppondido
		int preguntasRespondidas = 0;

		for (Respuesta respuesta : respuestaLista) {
			if (existeValorEnRespuesta(respuesta)) {
				preguntasRespondidas++;
			}
		}

		Verificador verificador = new Verificador();
		verificador.setEvaluacion(evaluacion);
		verificador.setParametro(parametro);
		verificador.setCantidadMedidas(cantidadMedidas);

		if (cumpleConUmbral) {
			verificador.setCumple(1);
		} else {
			verificador.setCumple(0);
		}

		// Se pone verificador en listado
		verificadorLista.add(verificador);
	}

	/**
	 * Consulta si una respuesta tiene valor, en este caso, significa que si se
	 * respondio la pregunta, caso contrario significa que no se respponde la
	 * pregunta y por ende no se debe contailizar.
	 * 
	 * @param respuesta
	 * @return
	 */
	private boolean existeValorEnRespuesta(Respuesta respuesta) {
		boolean hayValor = false;

		TipoPreguntaEnum tipopregunta = respuesta.getPregunta().getTipoPregunta().getClave();

		switch (tipopregunta) {
		case NUMERO:
			if (respuesta.getValorNumero() != null) {
				hayValor = true;
			}
			break;
		case TEXTO:
			if (respuesta.getValorTexto() != null && respuesta.getValorTexto().trim().length() > 0) {
				hayValor = true;
			}
			break;
		case FECHA:
			if (respuesta.getValorFecha() != null) {
				hayValor = true;
			}
			break;
		case BOOLEANO:
			if (respuesta.getValorBooleano() != null) {
				hayValor = true;
			}
			break;
		}

		return hayValor;
	}

	/**
	 * Se verifica que las preguntas tengan el numero de respuestas definidas en el
	 * umbral.
	 * 
	 * @param umbral
	 * @param codigoPreguntaList
	 * @param respuestasPorPreguntaMap
	 * @return
	 */
	private boolean verificarRespuestasDisponibles(int umbral, List<Long> codigoPreguntaList,
			Map<Long, Integer> respuestasPorPreguntaMap) {
		boolean umbralDisponible = true;

		for (Long codigoPregunta : codigoPreguntaList) {
			int respuestaDisponible = respuestasPorPreguntaMap.get(codigoPregunta);

			if (umbral < respuestaDisponible) {
				umbralDisponible = false;
				break;
			}
		}

		return umbralDisponible;
	}

	/**
	 * Cuenta las respuestas de una regunta.
	 * 
	 * @param codigoPreguntaList
	 * @param respuestaLista
	 * @return
	 */
	private Map<Long, Integer> contarRespuestasDePreguntas(List<Long> codigoPreguntaList,
			List<Respuesta> respuestaLista) {
		Map<Long, Integer> respuestaPorPreguntaMap = new HashMap<Long, Integer>();

		// Se cuentan respuestas por cada pregunta
		for (Long codigoPregunta : codigoPreguntaList) {
			int contador = 0;

			for (Respuesta respuesta : respuestaLista) {
				if (codigoPregunta.equals(respuesta.getPregunta().getCodigo())) {
					contador++;
				}
			}

			respuestaPorPreguntaMap.put(codigoPregunta, contador);
		}

		return respuestaPorPreguntaMap;
	}

	@Override
	public GenericDao<Evaluacion, Long> getDao() {
		// TODO Auto-generated method stub
		return null;
	}
}
