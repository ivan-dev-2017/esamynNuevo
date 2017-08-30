package ec.gob.acess.esamyn.modelo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

/**
 * 
 * Entidad que refleja la estructura de tabla esa_respuesta
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_respuesta")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "respuesta")
public class Respuesta implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "res_id")
	private Long codigo;
	@Column(name = "res_valor_numero")
	@XmlTransient
	private BigInteger valorNumero;
	@Column(name = "res_valor_texto")
	private String valorTexto;
	@Column(name = "res_valor_fecha")
	@Temporal(TemporalType.TIMESTAMP)
	private Date valorFecha;
	@Column(name = "res_valor_booleano")
	private Boolean valorBooleano;
	@JoinColumn(name = "res_encuesta", referencedColumnName = "enc_id")
	@ManyToOne
	private Encuesta encuesta;
	@JoinColumn(name = "res_pregunta", referencedColumnName = "prg_id")
	@ManyToOne
	private Pregunta pregunta;

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getValorTexto() {
		return valorTexto;
	}

	public void setValorTexto(String valorTexto) {
		this.valorTexto = valorTexto;
	}

	public Date getValorFecha() {
		return valorFecha;
	}

	public void setValorFecha(Date valorFecha) {
		this.valorFecha = valorFecha;
	}

	public Boolean getValorBooleano() {
		return valorBooleano;
	}

	public void setValorBooleano(Boolean valorBooleano) {
		this.valorBooleano = valorBooleano;
	}

	public Encuesta getEncuesta() {
		return encuesta;
	}

	public void setEncuesta(Encuesta encuesta) {
		this.encuesta = encuesta;
	}

	public Pregunta getPregunta() {
		return pregunta;
	}

	public void setPregunta(Pregunta pregunta) {
		this.pregunta = pregunta;
	}

}
