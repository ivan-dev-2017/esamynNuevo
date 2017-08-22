package acess.esamyn.ws;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import acess.esamyn.dto.AccesoDto;
import acess.esamyn.dto.MensajeDto;

/**
 * Session Bean implementation class HelloJAXRSWebService
 */
@Stateless
@LocalBean
@Path("/hola")
public class UsuarioWebService {

	/**
	 * Default constructor.
	 */
	public UsuarioWebService() {
		// TODO Auto-generated constructor stub
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MensajeDto sayHello(AccesoDto accesoDto) {

		return null;
	}
}
