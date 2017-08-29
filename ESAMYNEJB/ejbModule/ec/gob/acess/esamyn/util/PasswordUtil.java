package ec.gob.acess.esamyn.util;

import java.util.Random;

/**
 * 
 * Clase: PasswordUtil.java
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
public class PasswordUtil {

	/**
	 * 
	 * @param longitud
	 * @return
	 */
	public static String getCadenaAlfanumAleatoria(int longitud) {
		String cadenaAleatoria = "";
		long milis = new java.util.GregorianCalendar().getTimeInMillis();
		Random r = new Random(milis);
		int i = 0;
		while (i < longitud) {
			char c = (char) r.nextInt(255);
			if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z')) {
				cadenaAleatoria += c;
				i++;
			}
		}
		return cadenaAleatoria.toLowerCase();
	}
}