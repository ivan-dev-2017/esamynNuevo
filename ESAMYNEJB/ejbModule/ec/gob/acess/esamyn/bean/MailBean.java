package ec.gob.acess.esamyn.bean;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Properties;

import javax.ejb.EJB;
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

import ec.gob.acess.esamyn.constante.CatalogoEnum;
import ec.gob.acess.esamyn.constante.MailTypeEnum;
import ec.gob.acess.esamyn.dto.MailMessage;
import ec.gob.acess.esamyn.exception.MailException;

/**
 * 
 * Clase: MailBean.java
 * 
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless(name = "MailServicio")
@LocalBean
public class MailBean {

    private static final Logger LOG = Logger.getLogger(MailBean.class);

    @EJB
    private CatalogoBean catalogoBean;

    /**
     * Servicio que envia correos
     * 
     * @param message
     * @throws MailException
     */
    public void sender(MailMessage message) throws MailException {

	LOG.info("Entra a enviar correo.");

	InputStream input = null;

	try {

	    // PARAMETROS
	    String host = catalogoBean.buscarPorIdentificador(CatalogoEnum.HOST).getValor();
	    String puerto = catalogoBean.buscarPorIdentificador(CatalogoEnum.PUERTO).getValor();
	    String protocolo = catalogoBean.buscarPorIdentificador(CatalogoEnum.PROTOCOLO).getValor();
	    final String usuario = catalogoBean.buscarPorIdentificador(CatalogoEnum.USUARIO).getValor();
	    final String contrasenia = catalogoBean.buscarPorIdentificador(CatalogoEnum.CONTRASENIA).getValor();

	    Properties p = new Properties();
	    // DESARROLLO
	    if (host.equals("smtp.gmail.com")) {
		LOG.info("GMAIL.");
		p.put("mail.smtp.host", host);// "smtp.gmail.com
		p.put("mail.smtp.socketFactory.port", puerto);// PORT, 465
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.auth", true);
		p.put("mail.smtp.from", usuario);// message.getFrom(),
		// testmail@saviasoft.com/testmail12123
		p.put("mail.smtp.port", puerto);// PORT 465
		p.put("mail.transport.protocol", protocolo);
		p.put("mail.smtp.starttls.enable", true);

	    } else {

		LOG.info("OTRO CORREO.");
		// PRODUCCION
		p.put("mail.smtps.host", host);
		p.put("mail.smtps.auth", true);
		p.put("mail.smtps.from", usuario);
		p.put("mail.smtps.port", puerto);
		p.put("mail.transport.protocol", protocolo);// tiene que ser smtp
	    }

	    // Session mailSession = Session.getDefaultInstance(p);
	    Session mailSession = Session.getInstance(p, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(usuario, contrasenia);
		}
	    });

	    Transport transport = mailSession.getTransport();

	    if (message.getTipo() == null) {
		message.setTipo(MailTypeEnum.HTML);
	    }

	    MimeMessage mimeMessage = new MimeMessage(mailSession);

	    mimeMessage.setSubject(message.getTema(), "UTF-8");

	    mimeMessage.setContent(message.getContenido(), message.getTipo().getValor() + "; charset=UTF-8");

	    // si se manda atachemtns entones se reemplaza en content con
	    // atachemts y bodypart
	    if (message.getAttachList() != null) {
		Collection<File> fileList = message.getAttachList().values();
		if (fileList.size() > 0) {
		    MimeMultipart multipart = new MimeMultipart("related");
		    BodyPart messageBodyPartHtml = new MimeBodyPart();
		    messageBodyPartHtml.setContent(message.getContenido(),
			    message.getTipo().getValor() + "; charset=UTF-8");
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

	    InternetAddress from = new InternetAddress(usuario);
	    mimeMessage.setFrom(from);

	    transport.connect();
	    // (SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);
	    transport.sendMessage(mimeMessage, mimeMessage.getRecipients(t));

	    transport.close();

	} catch (IOException ex) {
	    throw new MailException(ex.getMessage());
	} catch (MessagingException e) {
	    throw new MailException(e.getMessage());
	} catch (Exception e) {
	    throw new MailException(e.getMessage());
	} finally {
	    if (input != null) {
		try {
		    input.close();
		} catch (IOException e) {
		    throw new MailException(e.getMessage());
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
