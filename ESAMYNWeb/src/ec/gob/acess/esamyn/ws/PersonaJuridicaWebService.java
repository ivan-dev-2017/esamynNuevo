package ec.gob.acess.esamyn.ws;

import java.util.List;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;

import ec.gob.acess.esamyn.bean.PersonaJuridicaBean;
import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.EliminarDto;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.modelo.PersonaJuridica;

/**
 * 
 * Clase PersonaJuridicaWebService.java que publica servicios web objeto PersonaJuridica
 * 
 * @author Duval Barragan @date Aug 25, 2017
 * @version 1.0
 *
 */
@Path("/personaJuridica")
public class PersonaJuridicaWebService {

    @EJB
    private UsuarioBean usuarioBean;
    @EJB
    private PersonaJuridicaBean personaJuridicaBean;

    /**
     * Default constructor.
     */
    public PersonaJuridicaWebService() {
	// TODO Auto-generated constructor stub
    }

    /**
     * Retorna lista de personaJuridicaes
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

		List<PersonaJuridica> listaPersonaJuridicaes = personaJuridicaBean.findAll();
		mensajeDto = new MensajeDto(false, "", listaPersonaJuridicaes);

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
     * @param personaJuridica
     * @param headers
     * @return
     */
    @POST
    @Path("guardar")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public MensajeDto guardar(PersonaJuridica personaJuridica, @Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);
	MensajeDto mensajeDto;
	try {
	    boolean valida = usuarioBean.validaToken(token);

	    if (valida) {

		mensajeDto = personaJuridicaBean.guardar(personaJuridica);

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

		PersonaJuridica personaJuridica = personaJuridicaBean.findByPk(codigoObjeto);

		if (personaJuridica != null) {
		    mensajeDto = new MensajeDto(false, "", personaJuridica);
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

    /**
     * Elimina objeto
     * 
     * @param eliminar
     * @param headers
     * @return
     */
    @DELETE
    @Path("eliminar")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public MensajeDto eliminar(EliminarDto eliminar, @Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);

	MensajeDto mensajeDto;
	boolean valida;
	try {
	    valida = usuarioBean.validaToken(token);

	    if (valida) {
		try {
		    personaJuridicaBean.delete(eliminar.getCodigo());
		    mensajeDto = new MensajeDto(false, "Objeto eliminado", null);
		} catch (Exception e) {
		    mensajeDto = new MensajeDto(true, "No se puede eliminar " + e.getMessage(), null);
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
