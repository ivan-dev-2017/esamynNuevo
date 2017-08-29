package ec.gob.acess.esamyn.dto;

import java.io.Serializable;

/**
 * 
 * Clase: MensajeDto.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
public class MensajeDto implements Serializable {

    private static final long serialVersionUID = 6508477246386600415L;

    private boolean error;

    private String mensaje;

    private Object objeto;

    public MensajeDto() {
	super();
    }

    public MensajeDto(boolean error, String mensaje, Object objeto) {
	super();
	this.error = error;
	this.mensaje = mensaje;
	this.objeto = objeto;
    }

    public boolean isError() {
	return error;
    }

    public void setError(boolean error) {
	this.error = error;
    }

    public String getMensaje() {
	return mensaje;
    }

    public void setMensaje(String mensaje) {
	this.mensaje = mensaje;
    }

    public Object getObjeto() {
	return objeto;
    }

    public void setObjeto(Object objeto) {
	this.objeto = objeto;
    }

}
