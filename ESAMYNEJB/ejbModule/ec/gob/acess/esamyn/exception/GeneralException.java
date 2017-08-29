
package ec.gob.acess.esamyn.exception;

import javax.ejb.ApplicationException;

/**
 * Clase que controla excepciones de los metodos de correos
 * 
 * @author Juan Ochoa Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@ApplicationException(rollback = true)
public class GeneralException extends RuntimeException {
    /**
     * 
     */
    private static final long serialVersionUID = 4430814155462912260L;
    private String summary;
    private String detail;
    private Throwable cause;

    public GeneralException(String summary) {
	this.summary = summary;
    }

    public GeneralException(String summary, Throwable cause) {
	this.summary = summary;
	this.cause = cause;
    }

    public GeneralException(String arg0, String summary, String detail) {
	this.summary = summary;
	this.detail = detail;
    }

    public GeneralException(String summary, String detail, Throwable cause) {
	this.summary = summary;
	this.detail = detail;
	this.cause = cause;
    }

    public String getSummary() {
	return summary;
    }

    public void setSummary(String summary) {
	this.summary = summary;
    }

    public String getDetail() {
	return detail;
    }

    public void setDetail(String detail) {
	this.detail = detail;
    }

    public Throwable getCause() {
	return cause;
    }

    public void setCause(Throwable cause) {
	this.cause = cause;
    }

}
