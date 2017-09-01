package ec.gob.acess.esamyn.ws;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;

import ec.gob.acess.esamyn.bean.EvaluacionBean;
import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Evaluacion;

/**
 * 
 * Clase EvaluacionWebService.java que publica servicios web objeto Evaluacion
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
@Path("/evaluacion")
public class EvaluacionWebService {
	@EJB
	private UsuarioBean usuarioBean;
	@EJB
	private EvaluacionBean evaluacionBean;

	/**
	 * Default constructor.
	 */
	public EvaluacionWebService() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * Retorna lista de evaluaciones
	 * 
	 * @param headers
	 * @return
	 */
	@GET
	@Path("todos")
	@Produces(MediaType.APPLICATION_JSON)
	public MensajeDto todos(@Context HttpHeaders headers) {

		MensajeDto mensajeDto;
		String token = headers.getRequestHeader("ApiToken").get(0);

		try {
			boolean valida = usuarioBean.validaToken(token);

			if (valida) {

				List<Evaluacion> listaEvaluaciones = evaluacionBean.findAll();
				mensajeDto = new MensajeDto(false, "", listaEvaluaciones);

			} else {
				mensajeDto = new MensajeDto(true, "Token invalido", null);
			}

		} catch (Exception e) {
			mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
		}
		return mensajeDto;
	}

	/**
	 * Busca por codigo de objeto
	 * 
	 * @param codigo
	 * @param headers
	 * @return
	 */
	@GET
	@Path("buscar/{codigo}")
	@Produces(MediaType.APPLICATION_JSON)
	public MensajeDto buscar(@PathParam("codigo") String codigo, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		MensajeDto mensajeDto;
		boolean valida;
		try {

			Long codigoObjeto = Long.parseLong(codigo);

			valida = usuarioBean.validaToken(token);

			if (valida) {

				Evaluacion evaluacion = evaluacionBean.findByPk(codigoObjeto);

				if (evaluacion != null) {
					mensajeDto = new MensajeDto(false, "", evaluacion);
				} else {
					mensajeDto = new MensajeDto(true, "No se encuentra objeto con código " + codigo, null);
				}

			} else {
				mensajeDto = new MensajeDto(true, "Token invalido", null);
			}
		} catch (Exception e) {
			mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
		}
		return mensajeDto;
	}
}
