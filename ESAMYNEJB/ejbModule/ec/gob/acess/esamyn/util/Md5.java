package ec.gob.acess.esamyn.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 
 * Clase: Md5.java
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
public class Md5 {

	private Md5() {
	}

	/**
	 * Aplica Hash a la cadena de texto
	 * 
	 * @param cadenaACodificar
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public static String aplicarHash(String cadenaACodificar) throws NoSuchAlgorithmException {

		MessageDigest m;
		m = MessageDigest.getInstance("MD5");
		byte messageDigest[] = m.digest(cadenaACodificar.getBytes());

		StringBuilder hexString = new StringBuilder();
		for (int i = 0; i < messageDigest.length; i++) {
			String hex = Integer.toHexString(0xFF & messageDigest[i]);
			if (hex.length() == 1)
				hexString.append('0');

			hexString.append(hex);
		}

		return hexString.toString();

	}

	public static void main(String[] args) throws NoSuchAlgorithmException {
		System.out.println(aplicarHash("1234"));
	}
}