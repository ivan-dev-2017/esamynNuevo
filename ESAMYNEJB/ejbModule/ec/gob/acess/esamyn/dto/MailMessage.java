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
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
public class MailMessage implements Serializable {

	private static final long serialVersionUID = 6737851095735445347L;

	private String content;

	private MailTypeEnum type;

	private String subject;
	// private String from;

	private List<String> to = new ArrayList<>();
	private List<String> cc = new ArrayList<>();
	private List<String> cco = new ArrayList<>();

	private HashMap<String, File> attachList;

	private String configuracion;

	public MailMessage() {
		super();
	}

	public MailMessage(String content, MailTypeEnum type, String subject, String from, List<String> to, List<String> cc,
			List<String> cco, HashMap<String, File> attachList, String configuracion) {
		super();
		this.content = content;
		this.type = type;
		this.subject = subject;
		this.to = to;
		this.cc = cc;
		this.cco = cco;
		this.attachList = attachList;
		this.configuracion = configuracion;
	}

	public MailMessage(String content, MailTypeEnum type, String subject, String from, List<String> to,
			String configuracion) {
		super();
		this.content = content;
		this.type = type;
		this.subject = subject;
		this.to = to;
		this.configuracion = configuracion;
	}

	// public InternetAddress getFromAddres() throws AddressException {
	// return new InternetAddress(this.from);
	// }

	public boolean isTieneAdjunto() {
		if (attachList != null && attachList.size() > 0) {
			return true;
		}
		return false;
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

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content
	 *            the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param subject
	 *            the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the to
	 */
	public List<String> getTo() {
		return to;
	}

	/**
	 * @param to
	 *            the to to set
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
	 * @param cc
	 *            the cc to set
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
	 * @param cco
	 *            the cco to set
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
	 * @param attachList
	 *            the attachList to set
	 */
	public void setAttachList(HashMap<String, File> attachList) {
		this.attachList = attachList;
	}

	public MailTypeEnum getType() {
		return type;
	}

	public void setType(MailTypeEnum type) {
		this.type = type;
	}

	public String getConfiguracion() {
		return configuracion;
	}

	public void setConfiguracion(String configuracion) {
		this.configuracion = configuracion;
	}

}
