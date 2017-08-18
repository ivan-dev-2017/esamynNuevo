package acess.esamyn.ws;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 * Session Bean implementation class HelloJAXRSWebService
 */
@Stateless
@LocalBean
@Path("/hola")
public class HolaWebService {

	/**
	 * Default constructor.
	 */
	public HolaWebService() {
		// TODO Auto-generated constructor stub
	}

	@GET
	@Produces("application/json")
	public String sayHello() {

		String dto = "ESAMYN pruebas";
		return dto;
	}
}
