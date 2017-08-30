package ec.gob.acess.esamyn.ws;

import java.util.List;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;

import ec.gob.acess.esamyn.bean.FormularioBean;
import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.Formulario;

/**
 * 
 * Clase: FormularioWebService.java
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */

@Path("formulario")
public class FormularioWebService {

    @EJB
    private UsuarioBean usuarioBean;
    @EJB
    private FormularioBean formularioBean;

    /**
     * Default constructor.
     */
    public FormularioWebService() {
	// TODO Auto-generated constructor stub
    }

    @GET
    @Path("lista/{idEstablecimiento}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public MensajeDto lista(@PathParam("idEstablecimiento") String idEstablecimiento, @Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);

	MensajeDto mensajeDto;

	try {
	    boolean valida = usuarioBean.validaToken(token);

	    if (valida) {

		List<Formulario> lista = formularioBean.findAll();
		mensajeDto = new MensajeDto(false, "", lista);

	    } else {
		mensajeDto = new MensajeDto(true, "Token invalido", null);
	    }

	} catch (Exception e) {
	    mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
	}

	return mensajeDto;
    }

    @GET
    @Path("todos")
    @Produces(MediaType.APPLICATION_JSON)
    public MensajeDto todos(@Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);

	MensajeDto mensajeDto;

	try {
	    boolean valida = usuarioBean.validaToken(token);

	    if (valida) {

		List<Formulario> lista = formularioBean.findAll();
		mensajeDto = new MensajeDto(false, "", lista);

	    } else {
		mensajeDto = new MensajeDto(true, "Token invalido", null);
	    }

	} catch (Exception e) {
	    mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
	}

	return mensajeDto;
    }

}
