/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acess.esamyn.modelo;

import java.io.Serializable;
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
@Table(name = "esa_verificador")
public class Verificador implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "ver_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "ver_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creado;
	@Basic(optional = false)
	@Column(name = "ver_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificado;
	@Basic(optional = false)
	@Column(name = "ver_cumple")
	private int cumple;
	@Basic(optional = false)
	@Column(name = "ver_no_aplica")
	private int noAplica;
	@Basic(optional = false)
	@Column(name = "ver_cantidad_medidas")
	private int cantidadMedidas;
	@JoinColumn(name = "ver_evaluacion", referencedColumnName = "eva_id")
	@ManyToOne
	private Evaluacion evaluacion;
	@JoinColumn(name = "ver_parametro", referencedColumnName = "par_id")
	@ManyToOne
	private Parametro parametro;

	public Verificador() {
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

	public int getCumple() {
		return cumple;
	}

	public void setCumple(int cumple) {
		this.cumple = cumple;
	}

	public int getNoAplica() {
		return noAplica;
	}

	public void setNoAplica(int noAplica) {
		this.noAplica = noAplica;
	}

	public int getCantidadMedidas() {
		return cantidadMedidas;
	}

	public void setCantidadMedidas(int cantidadMedidas) {
		this.cantidadMedidas = cantidadMedidas;
	}

	public Evaluacion getEvaluacion() {
		return evaluacion;
	}

	public void setEvaluacion(Evaluacion evaluacion) {
		this.evaluacion = evaluacion;
	}

	public Parametro getParametro() {
		return parametro;
	}

	public void setParametro(Parametro parametro) {
		this.parametro = parametro;
	}

}
