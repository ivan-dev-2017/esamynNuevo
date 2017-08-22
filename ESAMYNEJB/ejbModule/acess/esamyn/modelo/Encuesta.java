/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author saviasoft3
 */
@Entity
@Table(name = "esa_encuesta")
public class Encuesta implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "enc_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "enc_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creado;
	@Basic(optional = false)
	@Column(name = "enc_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificado;
	@Column(name = "enc_creado_por")
	private String creadoPor;
	@Column(name = "enc_modificado_por")
	private String modificadoPor;
	@Basic(optional = false)
	@Column(name = "enc_finalizada")
	private int finalizada;
	@Basic(optional = false)
	@Column(name = "enc_fecha_inicial")
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaInicial;
	@Column(name = "enc_fecha_final")
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaFinal;
	@Transient
	private List<Respuesta> respuestaLista;
	@JoinColumn(name = "enc_evaluacion", referencedColumnName = "eva_id")
	@ManyToOne
	private Evaluacion evaluacion;
	@JoinColumn(name = "enc_formulario", referencedColumnName = "frm_id")
	@ManyToOne
	private Formulario formulario;
	@JoinColumn(name = "enc_usuario", referencedColumnName = "usu_id")
	@ManyToOne
	private Usuario usuario;

	public Encuesta() {
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

	public int getFinalizada() {
		return finalizada;
	}

	public void setFinalizada(int finalizada) {
		this.finalizada = finalizada;
	}

	public Date getFechaInicial() {
		return fechaInicial;
	}

	public void setFechaInicial(Date fechaInicial) {
		this.fechaInicial = fechaInicial;
	}

	public Date getFechaFinal() {
		return fechaFinal;
	}

	public void setFechaFinal(Date fechaFinal) {
		this.fechaFinal = fechaFinal;
	}

	public List<Respuesta> getRespuestaLista() {
		return respuestaLista;
	}

	public void setRespuestaLista(List<Respuesta> respuestaLista) {
		this.respuestaLista = respuestaLista;
	}

	public Evaluacion getEvaluacion() {
		return evaluacion;
	}

	public void setEvaluacion(Evaluacion evaluacion) {
		this.evaluacion = evaluacion;
	}

	public Formulario getFormulario() {
		return formulario;
	}

	public void setFormulario(Formulario formulario) {
		this.formulario = formulario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
