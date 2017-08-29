/*
* MailTypeEnum.java
*
* Copyright (c) Saviasoft. Todos los derechos reservados.
*
* Mon Feb 20 15:20:47 ECT 2017
*/
package ec.gob.acess.esamyn.constante;


/**
 * 
 * Clase: MailTypeEnum.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
public enum MailTypeEnum {

	TEXT("text/plain"), HTML("text/html");

	private String valor;

	private MailTypeEnum(String valor) {
		this.valor = valor;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}
