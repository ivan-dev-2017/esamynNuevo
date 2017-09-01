package ec.gob.acess.esamyn.ws;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;

import ec.gob.acess.esamyn.bean.PreguntaBean;
import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.EncuestaDto;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.dto.PreguntaWsDto;
import ec.gob.acess.esamyn.dto.TextoObjetoDto;
import ec.gob.acess.esamyn.modelo.Pregunta;

/**
 * 
 * Clase: PreguntaWebService.java
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
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
    @Path("guardar")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public MensajeDto guardar(EncuestaDto encuestaDto, @Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);

	MensajeDto mensajeDto;
	try {
	    boolean valida = usuarioBean.validaToken(token);

	    if (valida) {

		mensajeDto = preguntaBean.guardarEncuesta(encuestaDto);

	    } else {
		mensajeDto = new MensajeDto(true, "Token invalido", null);
	    }

	} catch (Exception e) {
	    mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
	}
	return mensajeDto;
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

    /**
     * Metodo que guarda y actualiza
     * 
     * @param pregunta
     * @param headers
     * @return
     */
    @POST
    @Path("editar")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public MensajeDto editar(TextoObjetoDto textoObjeto, @Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);
	MensajeDto mensajeDto;
	try {
	    boolean valida = usuarioBean.validaToken(token);

	    if (valida) {

		mensajeDto = preguntaBean.editarTextoPregunta(textoObjeto.getCodigo(), textoObjeto.getTexto());

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

		Pregunta pregunta = preguntaBean.findByPk(codigoObjeto);

		if (pregunta != null) {
		    mensajeDto = new MensajeDto(false, "", pregunta);
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
