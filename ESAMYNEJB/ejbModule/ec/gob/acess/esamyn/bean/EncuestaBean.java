
package ec.gob.acess.esamyn.bean;

import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.saviasoft.persistence.util.constant.CriteriaTypeEnum;
import com.saviasoft.persistence.util.dao.GenericDao;
import com.saviasoft.persistence.util.service.impl.GenericServiceImpl;
import com.saviasoft.util.Criteria;

import ec.gob.acess.esamyn.dao.EncuestaDAO;
import ec.gob.acess.esamyn.dto.EncuestaDto;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.exception.EvaluacionException;
import ec.gob.acess.esamyn.modelo.Encuesta;
import ec.gob.acess.esamyn.modelo.Usuario;

/**
 * 
 * Clase que maneja la logica de clase Encuesta
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
public class EncuestaBean extends GenericServiceImpl<Encuesta, Long> {
	private static final Logger LOG = Logger.getLogger(EncuestaBean.class.getName());

	@EJB
	private EncuestaDAO encuestaDAO;

	@EJB
	private PreguntaBean preguntaBean;

	@EJB
	private EvaluacionBean evaluacionBean;

	@EJB
	private UsuarioBean usuarioBean;

	@Override
	public GenericDao<Encuesta, Long> getDao() {
		return encuestaDAO;
	}

	/**
	 * Guardar encuesta
	 * 
	 * @param encuesta
	 * @param usuario
	 * @return
	 */
	public MensajeDto guardar(Encuesta encuesta, Usuario usuario) {

		MensajeDto mensajeDto = new MensajeDto();

		try {

			if (encuesta.getCodigo() == null) {

				mensajeDto.setError(false);
				mensajeDto.setMensaje("Encuesta Guardado");
				encuesta.setCreadoPor(usuario.getUsername());
				encuesta.setModificadoPor(usuario.getUsername());
				encuesta.setUsuario(usuario);
				encuesta.setFechaInicial(new Date());

				create(encuesta);
				mensajeDto.setObjeto(encuesta);
			} else {
				mensajeDto.setError(false);
				mensajeDto.setMensaje("Actualiza Objeto");

				encuesta.setModificadoPor(usuario.getUsername());
				encuesta.setFechaInicial(new Date());

				update(encuesta);
				mensajeDto.setObjeto(encuesta);
			}

		} catch (Exception e) {
			mensajeDto.setError(true);
			mensajeDto.setMensaje("Error al guardar: " + e.getMessage());
			mensajeDto.setObjeto(null);
		}

		return mensajeDto;

	}

	/**
	 * Finaliza encuiesta (valida)
	 * 
	 * @param encuestaDto
	 * @param username
	 * @return
	 */
	public MensajeDto finalizarEncuesta(EncuestaDto encuestaDto, String token) {

		MensajeDto mensajeDto;
		try {
			if (preguntaBean.verificarParaFinalizarEncuesta(encuestaDto.getPregunta())) {

				Encuesta encuesta = findByPk(encuestaDto.getIdEncuesta());

				encuesta.setFechaFinal(new Date());
				encuesta.setFinalizada(1);

				update(encuesta);

				// Se llama a la ejecucion de la evaluacion
				Usuario usuario = usuarioBean.buscarPorToken(token);
				ejecutarEvaluacion(encuesta.getEstablecimientoSalud().getCodigo(), usuario);

				// Se crea el mensaje de res[uesta
				mensajeDto = new MensajeDto(false, "Encuesta finalizada", encuesta);
			} else {
				mensajeDto = new MensajeDto(true, "No se puede finalizar, existen preguntas sin contestar", null);
			}
		} catch (Exception e) {
			LOG.log(Level.SEVERE, e.getMessage(), e.getCause());
			mensajeDto = new MensajeDto(true, "No se encuentra usuario de token", null);
		}

		return mensajeDto;
	}

	public MensajeDto buscarPorEstablecimientoFormulario(Long codigoEstablecimiento, Long codigoFormulario) {

		MensajeDto mensajeDto;

		String[] ands = { "formulario.codigo", "establecimientoSalud.codigo" };
		CriteriaTypeEnum[] operator = { CriteriaTypeEnum.LONG_EQUALS, CriteriaTypeEnum.LONG_EQUALS };
		Object[] valores = { codigoFormulario, codigoEstablecimiento };
		String[] orderby = { "fechaInicial" };
		boolean[] asc = { true };

		Criteria criteria = new Criteria(ands, operator, valores, orderby, asc);

		List<Encuesta> lista = findByCriterias(criteria);

		if (lista != null && !lista.isEmpty()) {

			mensajeDto = new MensajeDto(false, "", lista);
		} else {
			mensajeDto = new MensajeDto(true, "No existe información", null);
		}

		return mensajeDto;
	}

	/**
	 * Se llama a la ejecucion de la evaluacion de un establecimiento de salud.
	 * 
	 * @param codigoEstablecimientoSalud
	 * @param username
	 */
	private void ejecutarEvaluacion(Long codigoEstablecimientoSalud, Usuario usuario) {
		try {
			evaluacionBean.crearEvaluacion(codigoEstablecimientoSalud, usuario);
		} catch (EvaluacionException e) {
			LOG.log(Level.SEVERE, e.getMessage(), e.getCause());
		}
	}
}
