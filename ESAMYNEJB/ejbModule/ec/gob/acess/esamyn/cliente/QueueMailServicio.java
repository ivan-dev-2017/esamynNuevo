/*
 * ClienteQueueMailServicioImpl.java Oct 27, 2014
 *
 * Copyright (c) 2014-2015 Saviasoft. Biodimed.
 * All rights reserved.
 *
 */
package ec.gob.acess.esamyn.cliente;

import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.jms.Session;

import org.jboss.logging.Logger;

import ec.gob.acess.esamyn.dto.MailMessage;

/**
 * 
 * Clase: QueueMailServicio.java
 * @author Duval Barragan
 * @date Aug 25, 2017
 * @version 1.0
 *
 */
@Stateless(name = "ClienteQueueMailServicio")
@LocalBean
public class QueueMailServicio {

	private static final Logger LOG = Logger.getLogger(QueueMailServicio.class);

	@Resource(mappedName = "java:/ConnectionFactory")
	private ConnectionFactory connectionFactory;

	@Resource(mappedName = "java:/jms/queue/MailESAMYN")
	private Queue queue;

	
	public void encolarMail(MailMessage mmessage) {

		LOG.info("ENCOLANDO MAIL...");

		Connection connection = null;
		Session session = null;

		try {
			connection = connectionFactory.createConnection();
			session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

			MessageProducer messageProducer = session.createProducer(queue);
			// objeto a encolar
			ObjectMessage objectMessage = session.createObjectMessage();
			objectMessage.setObject(mmessage);

			messageProducer.send(objectMessage);

		} catch (JMSException e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				try {
					session.close();
					if (connection != null) {
						connection.close();
					}
				} catch (JMSException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
