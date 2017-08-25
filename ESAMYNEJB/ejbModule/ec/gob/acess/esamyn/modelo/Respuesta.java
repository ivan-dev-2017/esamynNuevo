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

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_respuesta")
public class Respuesta implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "res_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "res_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creado;
	@Basic(optional = false)
	@Column(name = "res_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificado;
	@Column(name = "res_creado_por")
	private String creadoPor;
	@Column(name = "res_modificado_por")
	private String modificadoPor;
	@Column(name = "res_valor_numero")
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

	public Date getCreado() {
		return creado;
	}

	public void setCreado(Date creado) {
		this.creado = creado;
	}

	public Date getModificado() {
		return modificado;
	}

	public void setModificado(Date modificado) {
		this.modificado = modificado;
	}

	public String getCreadoPor() {
		return creadoPor;
	}

	public void setCreadoPor(String creadoPor) {
		this.creadoPor = creadoPor;
	}

	public String getModificadoPor() {
		return modificadoPor;
	}

	public void setModificadoPor(String modificadoPor) {
		this.modificadoPor = modificadoPor;
	}

	public BigInteger getValorNumero() {
		return valorNumero;
	}

	public void setValorNumero(BigInteger valorNumero) {
		this.valorNumero = valorNumero;
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
