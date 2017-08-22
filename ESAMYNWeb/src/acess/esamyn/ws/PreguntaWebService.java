package acess.esamyn.ws;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;

import acess.esamyn.bean.PreguntaBean;
import acess.esamyn.bean.UsuarioBean;
import acess.esamyn.dto.MensajeDto;
import acess.esamyn.dto.PreguntaDto;
import acess.esamyn.dto.PreguntaWsDto;

/**
 * Session Bean implementation class HelloJAXRSWebService
 */
@Stateless
@LocalBean
@Path("/pregunta")
public class PreguntaWebService {

	@EJB
	private UsuarioBean usuarioBean;

	@EJB
	private PreguntaBean preguntaBean;

	/**
	 * Default constructor.
	 */
	public PreguntaWebService() {
		// TODO Auto-generated constructor stub
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto buscarPreguntas(PreguntaWsDto pregunta, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		System.out.println("entra+" + token);

		boolean valida = usuarioBean.validaToken(token);

		MensajeDto dto;
		if (valida) {

			List<PreguntaDto> lista = preguntaBean.obtenerPreguntasFormulario(pregunta.getIdFormulario());

			if (lista != null) {
				dto = new MensajeDto(false, "", lista);
			} else {
				dto = new MensajeDto(true, "No existen preguntas para el formulario seleccionado", null);
			}

		} else {
			dto = new MensajeDto(true, "Token invalido", null);
		}
		return dto;
	}
}
