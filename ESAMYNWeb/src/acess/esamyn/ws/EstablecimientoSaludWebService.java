package acess.esamyn.ws;

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

import acess.esamyn.bean.FormularioBean;
import acess.esamyn.bean.UsuarioBean;
import acess.esamyn.dto.AccesoWsDto;
import acess.esamyn.dto.EliminarDto;
import acess.esamyn.dto.MensajeDto;
import acess.esamyn.modelo.Formulario;
import acess.esamyn.modelo.Usuario;

/**
 * Session Bean implementation class HelloJAXRSWebService
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

		String token = headers.getRequestHeader("ApiToken").get(0);

		System.out.println("entra+" + token);

		boolean valida = usuarioBean.validaToken(token);

		MensajeDto dto;
		if (valida) {

			List<Formulario> lista = formularioBean.findAll();
			dto = new MensajeDto(false, "", lista);

		} else {
			dto = new MensajeDto(true, "Token invalido", null);
		}
		return dto;
	}

}
