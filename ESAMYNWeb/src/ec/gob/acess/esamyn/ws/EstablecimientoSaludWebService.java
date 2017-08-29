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

import ec.gob.acess.esamyn.bean.EstablecimientoSaludBean;
import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.EstablecimientoSalud;

/**
 * 
 * Clase: EstablecimientoSaludWebService.java
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
@Path("/establecimientoSalud")
public class EstablecimientoSaludWebService {

    @EJB
    private UsuarioBean usuarioBean;
    @EJB
    private EstablecimientoSaludBean establecimientoSaludBean;

    /**
     * Default constructor.
     */
    public EstablecimientoSaludWebService() {
	// TODO Auto-generated constructor stub
    }

    @GET
    @Path("lista")
    @Produces(MediaType.APPLICATION_JSON)
    public MensajeDto lista(@Context HttpHeaders headers) {

	MensajeDto mensajeDto;
	String token = headers.getRequestHeader("ApiToken").get(0);

	try {
	    boolean valida = usuarioBean.validaToken(token);

	    if (valida) {

		List<EstablecimientoSalud> lista = establecimientoSaludBean.findAll();
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
