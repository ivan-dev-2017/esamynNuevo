package ec.gob.acess.esamyn.ws;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

/**
 * 
 * Clase: Aplicacion.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@ApplicationPath("/rest")
public class Aplicacion extends Application {

	@Override
	public Set<Class<?>> getClasses() {
		Set<Class<?>> classes = new HashSet<Class<?>>();
		classes.add(HolaWebService.class);
		classes.add(UsuarioWebService.class);
		classes.add(PreguntaWebService.class);
		classes.add(FormularioWebService.class);

		return classes;
	}

}
