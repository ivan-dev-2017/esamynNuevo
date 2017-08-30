/*
 * MailMessage.java
 *
* 
* Copyright (c) Saviasoft. Todos los derechos reservados.
*
* 04//MAYO/2017
*/
package ec.gob.acess.esamyn.dto;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import ec.gob.acess.esamyn.constante.MailTypeEnum;

/**
 * 
 * Clase: MailMessage.java
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
public class MailMessage implements Serializable {

	private static final long serialVersionUID = 6737851095735445347L;

	private String contenido;

	private MailTypeEnum tipo;

	private String tema;
	private List<String> to = new ArrayList<>();
	private List<String> cc = new ArrayList<>();
	private List<String> cco = new ArrayList<>();

	private HashMap<String, File> attachList;

	public MailMessage() {
		super();
	}

	public MailMessage(String content, MailTypeEnum type, String subject, List<String> to, List<String> cc,
			List<String> cco, HashMap<String, File> attachList) {
		super();
		this.contenido = content;
		this.tipo = type;
		this.tema = subject;
		this.to = to;
		this.cc = cc;
		this.cco = cco;
		this.attachList = attachList;
	}

	public MailMessage(String content, MailTypeEnum type, String subject,  List<String> to) {
		super();
		this.contenido = content;
		this.tipo = type;
		this.tema = subject;
		this.to = to;
	}
	

	/**
	 * @return the contenido
	 */
	public String getContenido() {
	    return contenido;
	}

	/**
	 * @param contenido the contenido to set
	 */
	public void setContenido(String contenido) {
	    this.contenido = contenido;
	}

	/**
	 * @return the tipo
	 */
	public MailTypeEnum getTipo() {
	    return tipo;
	}

	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(MailTypeEnum tipo) {
	    this.tipo = tipo;
	}

	/**
	 * @return the tema
	 */
	public String getTema() {
	    return tema;
	}

	/**
	 * @param tema the tema to set
	 */
	public void setTema(String tema) {
	    this.tema = tema;
	}

	/**
	 * @return the to
	 */
	public List<String> getTo() {
	    return to;
	}

	/**
	 * @param to the to to set
	 */
	public void setTo(List<String> to) {
	    this.to = to;
	}

	/**
	 * @return the cc
	 */
	public List<String> getCc() {
	    return cc;
	}

	/**
	 * @param cc the cc to set
	 */
	public void setCc(List<String> cc) {
	    this.cc = cc;
	}

	/**
	 * @return the cco
	 */
	public List<String> getCco() {
	    return cco;
	}

	/**
	 * @param cco the cco to set
	 */
	public void setCco(List<String> cco) {
	    this.cco = cco;
	}

	/**
	 * @return the attachList
	 */
	public HashMap<String, File> getAttachList() {
	    return attachList;
	}

	/**
	 * @param attachList the attachList to set
	 */
	public void setAttachList(HashMap<String, File> attachList) {
	    this.attachList = attachList;
	}

	public InternetAddress[] getToAddresses() throws AddressException {
		List<InternetAddress> resultado = new ArrayList<InternetAddress>();

		for (String t : this.to) {
			resultado.add(new InternetAddress(t));
		}

		return resultado.toArray(new InternetAddress[this.to.size()]);
	}

	public InternetAddress[] getCcAddresses() throws AddressException {
		List<InternetAddress> resultado = new ArrayList<InternetAddress>();

		for (String t : this.cc) {
			resultado.add(new InternetAddress(t));
		}

		return resultado.toArray(new InternetAddress[this.to.size()]);
	}

	public InternetAddress[] getCcoAddresses() throws AddressException {
		List<InternetAddress> resultado = new ArrayList<InternetAddress>();

		for (String t : this.cco) {
			resultado.add(new InternetAddress(t));
		}

		return resultado.toArray(new InternetAddress[this.to.size()]);
	}




}
