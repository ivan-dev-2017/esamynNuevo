package ec.gob.acess.esamyn.dto;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Clase: PreguntaWsDto.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "pregunta")
public class PreguntaWsDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9014875630963612166L;

	private Long idFormulario;

	private Long idEncuesta;

	public Long getIdFormulario() {
		return idFormulario;
	}

	public void setIdFormulario(Long idFormulario) {
		this.idFormulario = idFormulario;
	}

	public Long getIdEncuesta() {
		return idEncuesta;
	}

	public void setIdEncuesta(Long idEncuesta) {
		this.idEncuesta = idEncuesta;
	}

}
