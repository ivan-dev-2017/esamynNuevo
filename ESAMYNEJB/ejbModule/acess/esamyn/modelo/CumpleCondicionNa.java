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
@Table(name = "esa_cumple_condicion_na")
public class CumpleCondicionNa implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "ccn_id")
	private Long codigo;
	@Basic(optional = false)
	@Column(name = "ccn_creado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date ccnCreado;
	@Basic(optional = false)
	@Column(name = "ccn_modificado")
	@Temporal(TemporalType.TIMESTAMP)
	private Date ccnModificado;
	@Basic(optional = false)
	@Column(name = "ccn_cumple")
	private int ccnCumple;
	@Transient
	private List<Verificador> verificadorLista;
	@JoinColumn(name = "ccn_condicion_na", referencedColumnName = "cna_id")
	@ManyToOne(optional = false)
	private CondicionNa ccnCondicionNa;
	@JoinColumn(name = "ccn_evaluacion", referencedColumnName = "eva_id")
	@ManyToOne(optional = false)
	private Evaluacion evaluacion;

	public CumpleCondicionNa() {
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public Date getCcnCreado() {
		return ccnCreado;
	}

	public void setCcnCreado(Date ccnCreado) {
		this.ccnCreado = ccnCreado;
	}

	public Date getCcnModificado() {
		return ccnModificado;
	}

	public void setCcnModificado(Date ccnModificado) {
		this.ccnModificado = ccnModificado;
	}

	public int getCcnCumple() {
		return ccnCumple;
	}

	public void setCcnCumple(int ccnCumple) {
		this.ccnCumple = ccnCumple;
	}

	public List<Verificador> getVerificadorLista() {
		return verificadorLista;
	}

	public void setVerificadorLista(List<Verificador> verificadorLista) {
		this.verificadorLista = verificadorLista;
	}

	public CondicionNa getCcnCondicionNa() {
		return ccnCondicionNa;
	}

	public void setCcnCondicionNa(CondicionNa ccnCondicionNa) {
		this.ccnCondicionNa = ccnCondicionNa;
	}

	public Evaluacion getEvaluacion() {
		return evaluacion;
	}

	public void setEvaluacion(Evaluacion evaluacion) {
		this.evaluacion = evaluacion;
	}

}
