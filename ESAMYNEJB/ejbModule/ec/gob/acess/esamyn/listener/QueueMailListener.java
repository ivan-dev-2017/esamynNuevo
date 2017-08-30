package ec.gob.acess.esamyn.listener;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.EJB;
import javax.ejb.MessageDriven;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

import org.jboss.logging.Logger;

import ec.gob.acess.esamyn.bean.MailBean;
import ec.gob.acess.esamyn.cliente.QueueMailServicio;
import ec.gob.acess.esamyn.dto.MailMessage;
import ec.gob.acess.esamyn.exception.MailException;

/**
 * 
 * Clase: QueueMailListener.java
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@MessageDriven(activationConfig = {
		@ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue"),
		@ActivationConfigProperty(propertyName = "destination", propertyValue = "queue/MailESAMYN") })
public class QueueMailListener implements MessageListener {

	private static final Logger LOG = Logger.getLogger(QueueMailServicio.class);

	@EJB
	private MailBean mailBean;

	
	@Override
	public void onMessage(Message message) {

		LOG.info("Se procesa el elemento encolado...");

		if (message instanceof ObjectMessage) {
			try {
				MailMessage mm = (MailMessage) (((ObjectMessage) message).getObject());
				mailBean.sender(mm);
			} catch (JMSException e) {
				e.printStackTrace();
			} catch (MailException e) {
			    e.printStackTrace();
			}
		}

	}

}
