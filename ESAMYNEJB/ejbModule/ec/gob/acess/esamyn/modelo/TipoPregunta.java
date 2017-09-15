package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import ec.gob.acess.esamyn.constante.TipoPreguntaEnum;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_tipo_pregunta
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_tipo_pregunta")
public class TipoPregunta implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "tpp_id")
	private Long codigo;
	@Column(name = "tpp_clave")
	@Enumerated(EnumType.STRING)
	private TipoPreguntaEnum clave;
	@Column(name = "tpp_etiqueta")
	private String etiqueta;

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public TipoPreguntaEnum getClave() {
		return clave;
	}

	public void setClave(TipoPreguntaEnum clave) {
		this.clave = clave;
	}

	public String getEtiqueta() {
		return etiqueta;
	}

	public void setEtiqueta(String etiqueta) {
		this.etiqueta = etiqueta;
	}

}
