package ec.gob.acess.esamyn.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * Clase: FormularioDto.java
 * 
 * @author Duval Barragan 
 * Fecha: Aug 28, 2017
 * @version 1.0
 *
 */
public class FormularioDto implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 8772552351227252696L;
    private Date fecha;
    private String estado;
    private String contestados;

    public Date getFecha() {
	return fecha;
    }

    public void setFecha(Date fecha) {
	this.fecha = fecha;
    }

    public String getEstado() {
	return estado;
    }

    public void setEstado(String estado) {
	this.estado = estado;
    }

    public String getContestados() {
	return contestados;
    }

    public void setContestados(String contestados) {
	this.contestados = contestados;
    }

}
