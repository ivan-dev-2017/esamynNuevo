/*
 * EvaluacionException.java
 */

package acess.esamyn.exception;

import javax.ejb.ApplicationException;

/**
 * @author Juan Ochoa
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
