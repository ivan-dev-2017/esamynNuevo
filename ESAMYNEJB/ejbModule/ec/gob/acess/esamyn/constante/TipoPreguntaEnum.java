/*
* TipoPreguntaEnum.java
*
* Copyright (c) Saviasoft. Todos los derechos reservados.
*
* Wed Sep 20 11:20:41 ECT 2017
*/
package ec.gob.acess.esamyn.constante;

/**
 * 
 * Clase: TipoPreguntaEnum.java
 * 
 * @author Juan Ochoa
 * @date Sep 20, 2017
 * @version 1.0
 *
 */
public enum TipoPreguntaEnum {
	NUMERO, TEXTO, FECHA, BOOLEANO;

	/**
	 * Obtiene el tipo de pregunta dada una clave.
	 * 
	 * @param clave
	 * @return
	 */
	public static TipoPreguntaEnum getTipoPreguntaEnumPorClave(String clave) {
		TipoPreguntaEnum respuesta = null;

		for (TipoPreguntaEnum tipoPregunta : TipoPreguntaEnum.values()) {
			if (tipoPregunta.toString().equals(clave)) {
				respuesta = tipoPregunta;
				break;
			}
		}

		return respuesta;
	}
}
