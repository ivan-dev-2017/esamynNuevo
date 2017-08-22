package acess.esamyn.dto;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "pregunta")
public class PreguntaWsDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9014875630963612166L;

	private Long idFormulario;

	private Long idEstablecimiento;

	public Long getIdFormulario() {
		return idFormulario;
	}

	public void setIdFormulario(Long idFormulario) {
		this.idFormulario = idFormulario;
	}

	public Long getIdEstablecimiento() {
		return idEstablecimiento;
	}

	public void setIdEstablecimiento(Long idEstablecimiento) {
		this.idEstablecimiento = idEstablecimiento;
	}

}
