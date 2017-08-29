/*
 * MailServicioImpl.java
 *
* Clase Generada por GeneradorCodigo (Saviasoft)
* 
* Copyright (c) Saviasoft. Todos los derechos reservados.
*
* Mon Feb 20 15:20:47 ECT 2017
*/

package ec.gob.acess.esamyn.bean;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Properties;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.mail.BodyPart;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.jboss.logging.Logger;

import ec.gob.acess.esamyn.constante.MailTypeEnum;
import ec.gob.acess.esamyn.dto.MailMessage;
import ec.gob.acess.esamyn.exception.GeneralException;

/**
 * 
 * Clase: MailBean.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless(name = "MailServicio")
@LocalBean
public class MailBean {

    private static final Logger LOG = Logger.getLogger(MailBean.class);
    
    
    

    /**
     * @see(com.saviasoft.mail.servicio.MailServicio.sender)
     */
    public void sender(MailMessage message) throws GeneralException {

	LOG.info("Entra a enviar correo.");

	Properties prop = new Properties();
	InputStream input = null;

	try {

	    // PARAMETROS
	    String HOST = prop.getProperty("host");
	    String PORT = prop.getProperty("port");
	    String PROTOCOL = prop.getProperty("protocol");
	    final String USERNAME = prop.getProperty("username");
	    final String PASSWORD = prop.getProperty("password");
	    String FROM = prop.getProperty("from");
	    String DEBUG = prop.getProperty("debug");

	    Properties p = new Properties();
	    // DESARROLLO
	    if (HOST.equals("smtp.gmail.com")) {
		LOG.info("GMAIL.");
		p.put("mail.smtp.host", HOST);// "smtp.gmail.com
		p.put("mail.smtp.socketFactory.port", PORT);// PORT, 465
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.auth", true);
		p.put("mail.smtp.from", FROM);// message.getFrom(),
					      // testmail@saviasoft.com/testmail12123
		p.put("mail.smtp.port", PORT);// PORT 465
		p.put("mail.transport.protocol", PROTOCOL);
		p.put("mail.smtp.starttls.enable", true);

	    } else {

		LOG.info("OTRO CORREO.");
		// PRODUCCION
		p.put("mail.smtps.host", HOST);
		p.put("mail.smtps.auth", true);
		p.put("mail.smtps.from", FROM);
		p.put("mail.smtps.port", PORT);
		p.put("mail.transport.protocol", PROTOCOL);// tiene que ser smtp
	    }

	    // Session mailSession = Session.getDefaultInstance(p);
	    Session mailSession = Session.getInstance(p, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(USERNAME, PASSWORD);
		}
	    });

	    mailSession.setDebug(Boolean.parseBoolean(DEBUG));// true para desarrollo
	    Transport transport = mailSession.getTransport();

	    if (message.getType() == null) {
		message.setType(MailTypeEnum.HTML);
	    }

	    MimeMessage mimeMessage = new MimeMessage(mailSession);

	    mimeMessage.setSubject(message.getSubject(), "UTF-8");

	    mimeMessage.setContent(message.getContent(), message.getType().getValor() + "; charset=UTF-8");

	    // si se manda atachemtns entones se reemplaza en content con
	    // atachemts y bodypart
	    if (message.getAttachList() != null) {
		Collection<File> fileList = message.getAttachList().values();
		if (fileList.size() > 0) {
		    MimeMultipart multipart = new MimeMultipart("related");
		    BodyPart messageBodyPartHtml = new MimeBodyPart();
		    messageBodyPartHtml.setContent(message.getContent(),
			    message.getType().getValor() + "; charset=UTF-8");
		    multipart.addBodyPart(messageBodyPartHtml);
		    for (File file : fileList) {
			MimeBodyPart mbp = new MimeBodyPart();
			mbp.attachFile(file);
			multipart.addBodyPart(mbp);
		    }
		    mimeMessage.setContent(multipart);// reemplaza el de arriba
						      // si es q hay
						      // atachments
		}
	    }

	    int contMailsValidos = 0;
	    RecipientType t = RecipientType.BCC;

	    if (message.getTo() != null && !message.getTo().isEmpty()) {
		for (String to : message.getTo()) {
		    if (!isVacio(to)) {
			t = RecipientType.TO;
			mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(to));
			contMailsValidos++;
		    }
		}
	    }
	    // CO
	    if (message.getCc() != null && !message.getCc().isEmpty()) {
		for (String to : message.getCc()) {
		    if (!isVacio(to)) {
			t = RecipientType.CC;
			mimeMessage.addRecipient(RecipientType.CC, new InternetAddress(to));
			contMailsValidos++;
		    }
		}
	    }

	    // CCO
	    if (message.getCco() != null && !message.getCco().isEmpty()) {
		for (String to : message.getCco()) {
		    if (!isVacio(to)) {
			t = RecipientType.BCC;
			mimeMessage.addRecipient(RecipientType.BCC, new InternetAddress(to));
			contMailsValidos++;
		    }
		}
	    }

	    if (contMailsValidos == 0) {
		LOG.info("No existen mail validos, no envia correo....");
		return;
	    }

	    InternetAddress from = new InternetAddress(FROM);
	    mimeMessage.setFrom(from);

	    transport.connect();
	    // (SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);
	    transport.sendMessage(mimeMessage, mimeMessage.getRecipients(t));

	    transport.close();

	} catch (IOException ex) {
	    throw new GeneralException(ex.getMessage());
	} catch (MessagingException e) {
	    throw new GeneralException(e.getMessage());
	} catch (Exception e) {
	    throw new GeneralException(e.getMessage());
	} finally {
	    if (input != null) {
		try {
		    input.close();
		} catch (IOException e) {
		    throw new GeneralException(e.getMessage());
		}
	    }
	}

    }

    public static boolean isVacio(String texto) {
	boolean vacio = false;
	if (texto == null || texto.trim().equals("") || texto.trim().equals("null")) {
	    vacio = true;
	}
	return vacio;
    }

}
