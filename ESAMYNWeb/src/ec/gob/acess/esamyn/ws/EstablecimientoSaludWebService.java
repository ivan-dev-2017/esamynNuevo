package ec.gob.acess.esamyn.ws;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
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
 * Clase: EstablecimientoSaludWebService.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
@Path("/formulario")
public class EstablecimientoSaludWebService {

    @EJB
    private UsuarioBean usuarioBean;
    @EJB
    private FormularioBean formularioBean;

    /**
     * Default constructor.
     */
    public EstablecimientoSaludWebService() {
	// TODO Auto-generated constructor stub
    }

    @GET
    @Path("{lista}/")
    @Produces(MediaType.APPLICATION_JSON)
    public MensajeDto lista(@Context HttpHeaders headers) {

	MensajeDto mensajeDto;
	String token = headers.getRequestHeader("ApiToken").get(0);

	System.out.println("entra+" + token);

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
