package ec.gob.acess.esamyn.dto;

import java.io.Serializable;
import java.util.List;
/**
 * 
 * Clase: EncuestaDto.java
 * @author Duval Barragan
 * Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
public class EncuestaDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4397272294141523613L;

	private Long idEncuesta;

	private Long idFormulario;

	private String responsable;

	private String cargo;

	private String extra;

	private List<PreguntaDto> pregunta;

	public Long getIdFormulario() {
		return idFormulario;
	}

	public void setIdFormulario(Long idFormulario) {
		this.idFormulario = idFormulario;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getExtra() {
		return extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
	}

	public Long getIdEncuesta() {
		return idEncuesta;
	}

	public void setIdEncuesta(Long idEncuesta) {
		this.idEncuesta = idEncuesta;
	}

	public List<PreguntaDto> getPregunta() {
		return pregunta;
	}

	public void setPregunta(List<PreguntaDto> pregunta) {
		this.pregunta = pregunta;
	}

}
