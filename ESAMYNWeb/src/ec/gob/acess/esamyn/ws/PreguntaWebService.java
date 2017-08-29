package ec.gob.acess.esamyn.ws;

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

import ec.gob.acess.esamyn.bean.PreguntaBean;
import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.EncuestaDto;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.dto.PreguntaWsDto;

/**
 * 
 * Clase: PreguntaWebService.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
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

	MensajeDto mensajeDto;
	try {
	    boolean valida = usuarioBean.validaToken(token);

	    if (valida) {

		EncuestaDto encuesta = preguntaBean.obtenerPreguntasFormulario(pregunta.getIdFormulario(),
			pregunta.getIdEncuesta());

		if (encuesta != null) {
		    mensajeDto = new MensajeDto(false, "", encuesta);
		} else {
		    mensajeDto = new MensajeDto(true, "No existen preguntas para el formulario seleccionado", null);
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
