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
import ec.gob.acess.esamyn.modelo.Usuario;

/**
 * 
 * Clase: UsuarioWebService.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
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

		MensajeDto dto = usuarioBean.validarUsuarioContrasena(accesoDto.getUsuario(), accesoDto.getPassword());

		return dto;
	}

	@POST
	@Path("{guardar}/")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto guardar(Usuario usuario, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		System.out.println("entra+" + token);

		boolean valida = usuarioBean.validaToken(token);

		MensajeDto dto;
		if (valida) {
			dto = usuarioBean.guardar(usuario);

		} else {
			dto = new MensajeDto(true, "Token invalido", null);
		}
		return dto;
	}

	@GET
	@Path("{lista}/")
	@Produces(MediaType.APPLICATION_JSON)
	public MensajeDto lista(@Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		System.out.println("entra+" + token);

		boolean valida = usuarioBean.validaToken(token);

		MensajeDto dto;
		if (valida) {

			List<Usuario> lista = usuarioBean.findAll();
			dto = new MensajeDto(false, "", lista);

		} else {
			dto = new MensajeDto(true, "Token invalido", null);
		}
		return dto;
	}

	@POST
	@Path("{eliminar}/")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto eliminar(EliminarDto eliminar, @Context HttpHeaders headers) {

		String token = headers.getRequestHeader("ApiToken").get(0);

		System.out.println("entra+" + token);

		boolean valida = usuarioBean.validaToken(token);

		MensajeDto dto;
		if (valida) {
			try {
				usuarioBean.delete(eliminar.getCodigo());
				dto = new MensajeDto(false, "Objeto eliminado", null);
			} catch (Exception e) {
				dto = new MensajeDto(true, "No se puede eliminar " + e.getMessage(), null);
			}

		} else {
			dto = new MensajeDto(true, "Token invalido", null);
		}
		return dto;
	}

}
