package ec.gob.acess.esamyn.ws;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;

import ec.gob.acess.esamyn.bean.UsuarioBean;
import ec.gob.acess.esamyn.dto.AccesoWsDto;
import ec.gob.acess.esamyn.dto.EliminarDto;
import ec.gob.acess.esamyn.dto.MensajeDto;
import ec.gob.acess.esamyn.dto.PasswordWsDto;
import ec.gob.acess.esamyn.modelo.Usuario;

/**
 * 
 * Clase: UsuarioWebService.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless
@LocalBean
@Path("/usuario")
public class UsuarioWebService {

    @EJB
    private UsuarioBean usuarioBean;

    /**
     * Default constructor.
     */
    public UsuarioWebService() {
	// TODO Auto-generated constructor stub
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public MensajeDto login(AccesoWsDto accesoDto) {

	System.out.println("entra");

	MensajeDto mensajeDto = usuarioBean.validarUsuarioContrasena(accesoDto.getUsuario(), accesoDto.getPassword());

	return mensajeDto;
    }

    @POST
    @Path("guardar")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public MensajeDto guardar(Usuario usuario, @Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);
	MensajeDto mensajeDto;
	try {
	    boolean valida = usuarioBean.validaToken(token);

	    if (valida) {
		mensajeDto = usuarioBean.guardar(usuario);

	    } else {
		mensajeDto = new MensajeDto(true, "Token invalido", null);
	    }
	} catch (Exception e) {
	    mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
	}
	return mensajeDto;
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

		List<Usuario> lista = usuarioBean.findAll();
		mensajeDto = new MensajeDto(false, "", lista);

	    } else {
		mensajeDto = new MensajeDto(true, "Token invalido", null);
	    }
	} catch (Exception e) {
	    mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
	}
	return mensajeDto;
    }

    @POST
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
		    usuarioBean.delete(eliminar.getCodigo());
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

    @POST
    @Path("cambiar")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public MensajeDto eliminar(PasswordWsDto password, @Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);

	MensajeDto mensajeDto;
	boolean valida;
	try {
	    valida = usuarioBean.validaToken(token);

	    if (valida) {
		try {
		    mensajeDto = usuarioBean.cambiarPassword(password.getCodigoUsuario(), password.getPasswordAntiguo(),
			    password.getPasswordNuevo());
		} catch (Exception e) {
		    mensajeDto = new MensajeDto(true, "Error: " + e.getMessage(), null);
		}

	    } else {
		mensajeDto = new MensajeDto(true, "Token invalido", null);
	    }
	} catch (Exception e) {
	    mensajeDto = new MensajeDto(true, "Error token " + e.getMessage(), null);
	}
	return mensajeDto;
    }

    @POST
    @Path("cambiar")
    @Produces(MediaType.APPLICATION_JSON)
    public MensajeDto olvido(String userName, @Context HttpHeaders headers) {

	String token = headers.getRequestHeader("ApiToken").get(0);

	MensajeDto mensajeDto;
	boolean valida;
	try {
	    valida = usuarioBean.validaToken(token);

	    if (valida) {
		try {
		    mensajeDto = usuarioBean.olvidoPassword(userName);
		} catch (Exception e) {
		    mensajeDto = new MensajeDto(true, "Error: " + e.getMessage(), null);
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
