package ec.gob.acess.esamyn.ws;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 * 
 * Clase: HolaWebService.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
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
