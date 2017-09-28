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
	NUMERO("numero"), TEXTO("texto"), FECHA("fecha"), HORA("hora"), EMAIL("email");

	private String claveBdd;

	TipoPreguntaEnum(String claveBdd) {
		this.claveBdd = claveBdd;
	}

	/**
	 * @return the claveBdd
	 */
	public String getClaveBdd() {
		return claveBdd;
	}

	/**
	 * Obtiene el tipo de pregunta dada una clave.
	 * 
	 * @param clave
	 * @return
	 */
	public static TipoPreguntaEnum getTipoPreguntaEnumPorClave(String clave) {
		TipoPreguntaEnum respuesta = null;

		for (TipoPreguntaEnum tipoPregunta : TipoPreguntaEnum.values()) {
			if (tipoPregunta.getClaveBdd().equals(clave)) {
				respuesta = tipoPregunta;
				break;
			}
		}

		return respuesta;
	}
}
