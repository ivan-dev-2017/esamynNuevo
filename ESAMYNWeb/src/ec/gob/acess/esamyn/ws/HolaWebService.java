package ec.gob.acess.esamyn.ws;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 * 
 * Clase: HolaWebService.java
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
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

		String mensajeDto = "ESAMYN pruebas";
		return mensajeDto;
	}
}
