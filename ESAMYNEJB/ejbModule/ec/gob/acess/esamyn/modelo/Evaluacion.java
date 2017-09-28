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
 * Entidad que refleja la estructura de tabla esa_evaluacion
 * 
 * @author Duval Barragan
 * @date Aug 28, 2017
 * @version 1.0
 *
 */
@Entity
@Table(name = "esa_evaluacion")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "evaluacion")
public class Evaluacion implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "eva_id")
	private Long codigo;
	@Column(name = "eva_numero")
	@XmlTransient
	private Integer numero;
	@Column(name = "eva_calificacion")
	private BigInteger calificacion;
	@Basic(optional = false)
	@Column(name = "eva_fecha_inicio")
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaInicio;
	@Column(name = "eva_fecha_calificacion")
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaCalificacion;
	@Basic(optional = false)
	@Column(name = "eva_cantidad_encuestas")
	private int cantidadEncuestas;

	@JoinColumn(name = "eva_establecimiento_salud", referencedColumnName = "ess_id")
	@ManyToOne
	private EstablecimientoSalud establecimientoSalud;
	@JoinColumn(name = "eva_usuario", referencedColumnName = "usu_id")
	@ManyToOne
	private Usuario usuario;

	public Evaluacion() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	/**
	 * @return the numero
	 */
	public Integer getNumero() {
		return numero;
	}

	/**
	 * @param numero
	 *            the numero to set
	 */
	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public BigInteger getCalificacion() {
		return calificacion;
	}

	public void setCalificacion(BigInteger calificacion) {
		this.calificacion = calificacion;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaCalificacion() {
		return fechaCalificacion;
	}

	public void setFechaCalificacion(Date fechaCalificacion) {
		this.fechaCalificacion = fechaCalificacion;
	}

	public int getCantidadEncuestas() {
		return cantidadEncuestas;
	}

	public void setCantidadEncuestas(int cantidadEncuestas) {
		this.cantidadEncuestas = cantidadEncuestas;
	}

	public EstablecimientoSalud getEstablecimientoSalud() {
		return establecimientoSalud;
	}

	public void setEstablecimientoSalud(EstablecimientoSalud establecimientoSalud) {
		this.establecimientoSalud = establecimientoSalud;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
