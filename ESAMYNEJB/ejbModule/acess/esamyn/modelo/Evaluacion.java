/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_evaluacion")
public class Evaluacion implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "eva_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "eva_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creado;
	@Basic(optional = false)
	@Column(name = "eva_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificado;
	@Column(name = "eva_creado_por")
	private String creadoPor;
	@Column(name = "eva_modificado_por")
	private String modificadoPor;
	@Column(name = "eva_numero")
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
	@OneToMany(mappedBy = "verEvaluacion")
	private List<Verificador> verificadorList;
	@JoinColumn(name = "eva_establecimiento_salud", referencedColumnName = "ess_id")
	@ManyToOne
	private EstablecimientoSalud establecimientoSalud;
	@JoinColumn(name = "eva_usuario", referencedColumnName = "usu_id")
	@ManyToOne
	private Usuario usuario;
	@OneToMany(mappedBy = "encEvaluacion")
	private List<Encuesta> encuestaLista;

	public Evaluacion() {
	}

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

	public Integer getNumero() {
		return numero;
	}

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

	public List<Verificador> getVerificadorList() {
		return verificadorList;
	}

	public void setVerificadorList(List<Verificador> verificadorList) {
		this.verificadorList = verificadorList;
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

	public List<Encuesta> getEncuestaLista() {
		return encuestaLista;
	}

	public void setEncuestaLista(List<Encuesta> encuestaLista) {
		this.encuestaLista = encuestaLista;
	}

}
