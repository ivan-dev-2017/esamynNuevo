package acess.esamyn.ws;

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

import acess.esamyn.bean.UsuarioBean;
import acess.esamyn.dto.AccesoWsDto;
import acess.esamyn.dto.MensajeDto;
import acess.esamyn.modelo.Usuario;

/**
 * Session Bean implementation class HelloJAXRSWebService
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
}
