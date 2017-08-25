
package ec.gob.acess.esamyn.exception;

import javax.ejb.ApplicationException;

/**
 * 
 * Clase: EvaluacionException.java
 * @author Juan Ochoa
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@ApplicationException(rollback = true)
@SuppressWarnings(value = "serial")
public class EvaluacionException extends Exception {
	private String summary;
	private Throwable cause;

	public EvaluacionException(String summary) {
		this.summary = summary;
	}

	public EvaluacionException(String summary, Throwable cause) {
		this.summary = summary;
		this.cause = cause;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Throwable getCause() {
		return cause;
	}

	public void setCause(Throwable cause) {
		this.cause = cause;
	}

}
